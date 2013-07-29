set(wxroot ${CMAKE_SOURCE_DIR})
set(CMAKE_MODULE_PATH ${wxroot}/build/cmake ${CMAKE_MODULE_PATH})
include(flags OPTIONAL)
set_property(GLOBAL PROPERTY USE_FOLDERS ON) # enables MSVC Solution Folders
add_definitions(-D_LIB)
set(CMAKE_DEBUG_POSTFIX)
set(CMAKE_RELEASEMT_POSTFIX)
set(CMAKE_RELEASE_POSTFIX)
set(LIBRARY_OUTPUT_PATH ${CMAKE_BINARY_DIR}/lib${NUMBITS})
include_directories(${wxroot}/include ${LIBRARY_OUTPUT_PATH})
if(NOT DEFINED WX_VERSION)
  set(WX_VERSION 00)
endif()
string(REGEX REPLACE "^([0-9])\([0-9]*)$" "wx-\\1.\\2" wxver ${WX_VERSION})

#######################################
# setup.h
# NOTE: include_directories above will find setup.h from ${LIBRARY_OUTPUT_PATH}
set(wxsetup ${wxroot}/include/wx/msw/setup.h)
if(NOT EXISTS ${LIBRARY_OUTPUT_PATH}/wx)
  execute_process(COMMAND ${CMAKE_COMMAND} -E make_directory
    ${LIBRARY_OUTPUT_PATH}/wx)
endif()
execute_process(COMMAND ${CMAKE_COMMAND} -E copy_if_different
  ${wxsetup} ${LIBRARY_OUTPUT_PATH}/wx)

#######################################
# set_wx_target_properties function
# @param[in] target : cmake target
function(set_wxtarget_properties target)
  if(MSVC)
    # toolset
    if(MSVC11)
      set(toolset vc110)
    elseif(MSVC10)
      set(toolset vc100)
    elseif(MSVC90)
      set(toolset vc90)
    elseif(MSVC80)
      set(toolset vc80)
    elseif(MSVC71)
      set(toolset vc71)
    elseif(MSVC70)
      set(toolset vc70)
    elseif(MSVC60)
      set(toolset vc60)
    else()
      set(toolset vcXX)
      message(SEND_ERROR "wx.cmake: MSVC compiler support lacking")
    endif()
    # wxbasename
    set(wxbasename wxmsw)
  else()
    set(wxbasename wxX)
  endif()
  if(${target} MATCHES "base")
    get_directory_property(global_includes INCLUDE_DIRECTORIES)
    set_property(TARGET ${target} PROPERTY
      INCLUDE_DIRECTORIES ${global_includes} ${wxroot}/src/regex ${wxroot}/src/zlib)
    set_property(TARGET ${target} PROPERTY
      COMPILE_DEFINITIONS __WXMSW__ WXBUILDING wxUSE_GUI=0 wxUSE_BASE=1)
    set_property(TARGET ${target} PROPERTY FOLDER wxbase_libs)
    set_target_properties(${target} PROPERTIES
      OUTPUT_NAME wxbase${WX_VERSION}${toolset}x
      DEBUG_OUTPUT_NAME wxbase${WX_VERSION}${toolset}d
      RELEASEMT_OUTPUT_NAME wxbase${WX_VERSION}${toolset}s
      RELEASE_OUTPUT_NAME wxbase${WX_VERSION}${toolset}
      COMPILE_FLAGS /W4
      )
    install(FILES ${wxsetup} DESTINATION lib${NUMBITS}/msw/${wxver}/wx)
  elseif(${target} MATCHES "net" OR ${target} MATCHES "odbc" OR ${target} MATCHES "xml")
    set_property(TARGET ${target} PROPERTY
      COMPILE_DEFINITIONS __WXMSW__ WXBUILDING wxUSE_GUI=0)
    set_property(TARGET ${target} PROPERTY FOLDER wxbase_libs)
    set_target_properties(${target} PROPERTIES
      OUTPUT_NAME wxbase${WX_VERSION}${toolset}x_${target}
      DEBUG_OUTPUT_NAME wxbase${WX_VERSION}${toolset}d_${target}
      RELEASEMT_OUTPUT_NAME wxbase${WX_VERSION}${toolset}s_${target}
      RELEASE_OUTPUT_NAME wxbase${WX_VERSION}${toolset}_${target}
      COMPILE_FLAGS /W4
      )
  elseif(${target} MATCHES "^wx") # any target that starts with "wx"
    set_property(TARGET ${target} PROPERTY FOLDER wxthirdparty_libs)
    set_target_properties(${target} PROPERTIES
      OUTPUT_NAME ${target}${WX_VERSION}_${toolset}x
      DEBUG_OUTPUT_NAME ${target}${WX_VERSION}_${toolset}d
      RELEASEMT_OUTPUT_NAME ${target}${WX_VERSION}_${toolset}s
      RELEASE_OUTPUT_NAME ${target}${WX_VERSION}_${toolset}
      COMPILE_FLAGS /W1
      )
  else()
    get_target_property(target_defs ${target} COMPILE_DEFINITIONS)
    if(NOT target_defs)
      set(target_defs)
    endif()
    set_property(TARGET ${target} PROPERTY
      COMPILE_DEFINITIONS __WXMSW__ WXBUILDING ${target_defs})
    set_property(TARGET ${target} PROPERTY FOLDER ${wxbasename}_libs)
    set_target_properties(${target} PROPERTIES
      OUTPUT_NAME ${wxbasename}${WX_VERSION}${toolset}x_${target}
      DEBUG_OUTPUT_NAME ${wxbasename}${WX_VERSION}${toolset}d_${target}
      RELEASEMT_OUTPUT_NAME ${wxbasename}${WX_VERSION}${toolset}s_${target}
      RELEASE_OUTPUT_NAME ${wxbasename}${WX_VERSION}${toolset}_${target}
      COMPILE_FLAGS /W4
      )
  endif()
  # NOTE: It appears /MACHINE needs to be specified if target has an .rc
  if(${CMAKE_GENERATOR} MATCHES "Win64$")
    # http://public.kitware.com/Bug/view.php?id=11240
    set_target_properties(${target} PROPERTIES STATIC_LIBRARY_FLAGS "/MACHINE:X64")
  elseif(MSVC)
    # MSVC defaults to X86, but specifying it here avoids a link warning (LNK4068)
    set_target_properties(${target} PROPERTIES STATIC_LIBRARY_FLAGS "/MACHINE:X86")
  endif()
  install(TARGETS ${lib_name} DESTINATION lib${NUMBITS})
endfunction()

#######################################
# wx libraries
# NOTE: ordered by library dependencies
# see http://docs.wxwidgets.org/trunk/page_libs.html
set(wxlibs
  wxexpat
  wxjpeg
  wxpng
  wxregex
  wxtiff
  wxzlib
  base
  net
  odbc
  xml
  core
  adv
  gl
  html
  media
  dbgrid
  aui
  xrc
  richtext
  qa
  )
foreach(lib ${wxlibs})
  include(${lib})
endforeach()

#######################################
# wx headers
file(GLOB wxhdrs ${wxroot}/include/wx/*.h)
file(GLOB wxcpps ${wxroot}/include/wx/*.cpp)
install(DIRECTORY
  ${wxroot}/include/wx/aui
  ${wxroot}/include/wx/generic
  ${wxroot}/include/wx/html
  ${wxroot}/include/wx/msw
  ${wxroot}/include/wx/protocol
  ${wxroot}/include/wx/richtext
  ${wxroot}/include/wx/xml
  ${wxroot}/include/wx/xrc
  DESTINATION include/${wxver}/wx
  PATTERN ".cvsignore" EXCLUDE
  )
install(FILES ${wxhdrs} ${wxcpps} DESTINATION include/${wxver}/wx)
set(customsetuph ${wxroot}/build/cmake/setup.h)
install(FILES ${customsetuph} DESTINATION include/${wxver}/wx/msvc/wx)
