set(WX_NAMESPACE "wx::") # NOTE: hard-coded in wxwidgets-targets.cmake
set(targetsFile ${PROJECT_NAME}-targets)
string(TOUPPER ${CMAKE_PROJECT_NAME} PRJ)
string(JOIN "\n" EXT1 # TRICKY: set wx_all_libs before targets file include
  "# http://docs.wxwidgets.org/trunk/page_libs.html"
  "# TRICKY: reverse dependency order (base should be last)"
  "set(wx_all_libs aui propgrid richtext adv gl html core net xml base)"
  ""
  )
string(JOIN "\n" EXT2
  "if(NOT DEFINED wx_libs)"
  "  set(wx_libs \${wx_all_libs})"
  "endif()"
  "set(${PRJ}_LIBRARIES \${wx_libs})"
  "list(TRANSFORM ${PRJ}_LIBRARIES PREPEND ${WX_NAMESPACE})"
  "list(APPEND reqVars ${PRJ}_LIBRARIES)"
  ""
  )
if(DEFINED GTK_VER AND DEFINED GTK_VERSION)
  string(JOIN "\n" EXT3
    "set(wxGTK_VER ${GTK_VER})"
    "set(wxGTK${GTK_VER}_VERSION ${GTK_VERSION})"
    "list(APPEND reqVars wxGTK_VER wxGTK${GTK_VER}_VERSION)"
    ""
    )
endif()
if(UNIX)
  string(JOIN "\n" EXT4
    "list(APPEND reqVars wxWidgets_CONFIG_EXECUTABLE)"
    ""
    )
endif()
xpExternPackage(REPO_NAME wxWidgets TARGETS_FILE ${targetsFile}
  BASE v3.1.0 XPDIFF "intro(msw), native(unix)"
  WEB "http://wxwidgets.org/" UPSTREAM "github.com/wxWidgets/wxWidgets"
  DESC "Cross-Platform C++ GUI Library"
  LICENSE "[wxWindows](https://wxwidgets.org/about/licence/ 'essentially LGPL with an exception')"
  )
file(READ "${CMAKE_SOURCE_DIR}/include/wx/version.h" _version_h)
string(REGEX MATCH "#define wxMAJOR_VERSION[ \\t]+([0-9]+)" _ ${_version_h})
set(wxMAJOR_VERSION ${CMAKE_MATCH_1})
string(REGEX MATCH "#define wxMINOR_VERSION[ \\t]+([0-9]+)" _ ${_version_h})
set(wxMINOR_VERSION ${CMAKE_MATCH_1})
set(wxIncDir "${CMAKE_INSTALL_INCLUDEDIR}/wx-${wxMAJOR_VERSION}.${wxMINOR_VERSION}")
unset(_version_h)
option(XP_EXPOSE_WXTIFF "expose wxtiff library" OFF)
install(FILES ${CMAKE_SOURCE_DIR}/include/wx/msw/winundef.h DESTINATION ${wxIncDir}/externpro)
if(UNIX AND NOT ${CMAKE_SYSTEM_NAME} STREQUAL Darwin)
  # TODO: detect package required to build on rhel:
  #   dnf install libSM-devel.x86_64
  find_package(PkgConfig)
  #####
  # gtk
  if(NOT GTK2_FOUND)
    pkg_check_modules(GTK3 gtk+-3.0)
  endif()
  if(GTK3_FOUND)
    set(GTK_VER 3 CACHE STRING "gtk major version" FORCE)
    set(GTK_VERSION ${GTK3_VERSION} CACHE STRING "gtk version" FORCE)
    set_property(CACHE GTK_VER GTK_VERSION PROPERTY TYPE INTERNAL)
  else()
    pkg_check_modules(GTK2 gtk+-2.0)
    if(GTK2_FOUND)
      set(GTK_VER 2 CACHE STRING "gtk major version" FORCE)
      set(GTK_VERSION ${GTK2_VERSION} CACHE STRING "gtk version" FORCE)
      set_property(CACHE GTK_VER GTK_VERSION PROPERTY TYPE INTERNAL)
    else()
      message(FATAL_ERROR "\n"
        "gtk development not found -- wxWidgets can't be built. install on linux:\n"
        "  apt install libgtk2.0-dev or libgtk-3-dev\n"
        "  dnf install gtk2-devel.x86_64 or gtk3-devel.x86_64\n"
        )
    endif()
  endif()
  ########
  # OpenGL
  find_package(OpenGL)
  if(NOT OPENGL_FOUND OR NOT OPENGL_GLU_FOUND)
    message(FATAL_ERROR "\n"
      "OpenGL or GLU not found -- wxWidgets can't be built. install on linux:\n"
      "  apt install libglu1-mesa-dev\n"
      "  dnf install mesa-libGL-devel.x86_64 mesa-libGLU-devel.x86_64\n"
      )
  endif()
endif()
