if(${CMAKE_SYSTEM_NAME} STREQUAL "Darwin")
  # http://forums.wxwidgets.org/viewtopic.php?f=19&t=37432
  set(XP_CONFIGURE ${CMAKE_SOURCE_DIR}/configure --with-osx)
  execute_process(
    COMMAND xcrun --sdk macosx --show-sdk-path
    OUTPUT_VARIABLE sdkPath
    OUTPUT_STRIP_TRAILING_WHITESPACE
    )
  if(sdkPath)
    list(APPEND XP_CONFIGURE --with-macosx-sdk=${sdkPath})
  endif()
elseif(DEFINED GTK_VER)
  set(XP_CONFIGURE ${CMAKE_SOURCE_DIR}/configure --with-gtk=${GTK_VER})
else()
  message(FATAL_ERROR "\n"
    "wxWidgets can't be built on ${CMAKE_SYSTEM_NAME} -- no GTK or macOS found.\n"
    )
endif()
if(${CMAKE_CXX_COMPILER_ID} MATCHES "Clang")
  list(APPEND XP_CONFIGURE CXX=clang++)
endif()
if(${CMAKE_C_COMPILER_ID} MATCHES "Clang")
  list(APPEND XP_CONFIGURE CC=clang)
endif()
execute_process(COMMAND uname --machine
  OUTPUT_VARIABLE unameMachine
  OUTPUT_STRIP_TRAILING_WHITESPACE
  ERROR_VARIABLE unameErr
  )
if(DEFINED unameMachine AND NOT unameErr AND unameMachine MATCHES "^aarch")
  list(APPEND XP_CONFIGURE --build=aarch64-unknown-linux-gnu --enable-arm-neon)
endif()
xpGetConfigureFlags(CXX wx_CONFIGURE_FLAGS)
list(APPEND XP_CONFIGURE ${wx_CONFIGURE_FLAGS} --with-opengl
  --with-libjpeg=builtin --with-libpng=builtin --with-libtiff=builtin
  --with-expat=builtin --with-regex=builtin --with-zlib=builtin
  #TODO: --without-subdirs (what does this option do? saw it used in wx forums)
  --disable-shared --disable-precomp-headers --without-libnotify
  # NOTE: without-libnotify so we can build wxWidgets on a system that has libnotify
  # and use the built wxWidgets package on a system that doesn't have it
  --enable-display --enable-std_string --enable-std_iostreams --enable-std_containers
  )
set(CMAKE_INSTALL_LIBDIR lib) # TRICKY: wx-config expects this to be lib (not lib64)
set(XP_CONFIGURE_INSTALL ${XP_CONFIGURE} --prefix=<INSTALL_DIR>
  --includedir=<INSTALL_DIR>/${CMAKE_INSTALL_INCLUDEDIR}
  --bindir=<INSTALL_DIR>/${CMAKE_INSTALL_BINDIR}
  --libdir=<INSTALL_DIR>/${CMAKE_INSTALL_LIBDIR}
  )
# release version of wx is all we need
# http://wxwidgets.blogspot.com/2009/09/debug-build-changes-in-wx3.html
if(NOT TARGET ${CMAKE_PROJECT_NAME})
  message(STATUS "target ${CMAKE_PROJECT_NAME}")
  xpVerboseListing("[CONFIGURE]" "${XP_CONFIGURE_INSTALL}")
  include(ExternalProject)
  set_property(DIRECTORY PROPERTY "EP_BASE" ${CMAKE_BINARY_DIR}/epbase)
  ExternalProject_Add(${CMAKE_PROJECT_NAME}
    DOWNLOAD_COMMAND "" SOURCE_DIR ${CMAKE_SOURCE_DIR}
    CONFIGURE_COMMAND ${XP_CONFIGURE_INSTALL}
    BUILD_COMMAND   # use default
    INSTALL_COMMAND # use default
    )
endif()
ExternalProject_Get_Property(${CMAKE_PROJECT_NAME} INSTALL_DIR)
string(JOIN "\n" wxconfigScriptContent
  "file(GLOB cfgFiles \"\${cfgDir}/[^inplace]*\")"
  "list(GET cfgFiles 0 cfgFile)"
  "cmake_path(GET cfgFile FILENAME cfgFileName)"
  "file(REAL_PATH \${cfgFile} cfgFile)"
  "file(REAL_PATH \${installDir}/${CMAKE_INSTALL_BINDIR} binDir)"
  "file(REAL_PATH \${installDir}/${CMAKE_INSTALL_LIBDIR}/wx/config libDir)"
  "file(COPY_FILE \${cfgFile} \${binDir}/wx-config)"
  "file(COPY_FILE \${cfgFile} \${libDir}/\${cfgFileName})"
  ""
  )
set(wxconfigScript "${CMAKE_CURRENT_BINARY_DIR}/wxconfig.cmake")
file(WRITE ${wxconfigScript} "${wxconfigScriptContent}")
if(NOT TARGET wxconfig)
  ExternalProject_Add(wxconfig DEPENDS ${CMAKE_PROJECT_NAME}
    DOWNLOAD_COMMAND "" SOURCE_DIR ${CMAKE_SOURCE_DIR}
    CONFIGURE_COMMAND ${XP_CONFIGURE} # TRICKY: not XP_CONFIGURE_INSTALL
    BUILD_COMMAND ${CMAKE_COMMAND} -DcfgDir:STRING=<BINARY_DIR>/lib/wx/config
      -DinstallDir:STRING=${INSTALL_DIR} -P ${wxconfigScript}
    INSTALL_COMMAND ""
    )
endif()
install(DIRECTORY ${INSTALL_DIR}/${CMAKE_INSTALL_INCLUDEDIR}/ DESTINATION ${CMAKE_INSTALL_INCLUDEDIR})
install(DIRECTORY ${INSTALL_DIR}/${CMAKE_INSTALL_LIBDIR}/ DESTINATION ${CMAKE_INSTALL_LIBDIR})
install(PROGRAMS ${INSTALL_DIR}/${CMAKE_INSTALL_BINDIR}/wx-config DESTINATION ${CMAKE_INSTALL_BINDIR})
install(FILES ${CMAKE_CURRENT_LIST_DIR}/${targetsFile}.cmake DESTINATION ${XP_INSTALL_CMAKEDIR})
