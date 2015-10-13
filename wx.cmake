set(wxroot ${CMAKE_SOURCE_DIR})
set(CMAKE_MODULE_PATH ${wxroot}/build/cmake ${CMAKE_MODULE_PATH})
include(flags OPTIONAL)
set_property(GLOBAL PROPERTY USE_FOLDERS ON) # enables MSVC Solution Folders
add_definitions(-D_LIB)
# reset any postfix setting done previously
set(CMAKE_DEBUG_POSTFIX)
set(CMAKE_RELEASE_POSTFIX)
set(LIBRARY_OUTPUT_PATH ${CMAKE_BINARY_DIR}/lib)
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
    if(MSVC12)
      set(toolset vc120)
    elseif(MSVC11)
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
  if(XP_BUILD_STATIC_RT) # from flags.cmake include, xpCommonFlags, xpopts.cmake
    set(static s)
  endif()
  if(${target} MATCHES "base")
    get_directory_property(global_includes INCLUDE_DIRECTORIES)
    set_property(TARGET ${target} PROPERTY
      INCLUDE_DIRECTORIES ${global_includes} ${wxroot}/src/regex ${wxroot}/src/zlib)
    set_property(TARGET ${target} PROPERTY
      COMPILE_DEFINITIONS __WXMSW__ WXBUILDING wxUSE_GUI=0 wxUSE_BASE=1 UNICODE _UNICODE)
    set_property(TARGET ${target} PROPERTY FOLDER wxbase_libs)
    set_target_properties(${target} PROPERTIES
      OUTPUT_NAME wxbase${WX_VERSION}${toolset}u${static}x
      DEBUG_OUTPUT_NAME wxbase${WX_VERSION}${toolset}u${static}d
      RELEASE_OUTPUT_NAME wxbase${WX_VERSION}${toolset}u${static}
      COMPILE_FLAGS /W4
      )
    install(FILES ${wxsetup} DESTINATION lib/msw/${wxver}/wx)
  elseif(${target} MATCHES "net" OR ${target} MATCHES "xml")
    set_property(TARGET ${target} PROPERTY
      COMPILE_DEFINITIONS __WXMSW__ WXBUILDING wxUSE_GUI=0 UNICODE _UNICODE)
    set_property(TARGET ${target} PROPERTY FOLDER wxbase_libs)
    set_target_properties(${target} PROPERTIES
      OUTPUT_NAME wxbase${WX_VERSION}${toolset}u${static}x_${target}
      DEBUG_OUTPUT_NAME wxbase${WX_VERSION}${toolset}u${static}d_${target}
      RELEASE_OUTPUT_NAME wxbase${WX_VERSION}${toolset}u${static}_${target}
      COMPILE_FLAGS /W4
      )
  elseif(${target} MATCHES "^wx") # any target that starts with "wx"
    set_property(TARGET ${target} PROPERTY FOLDER wxthirdparty_libs)
    get_property(_defs TARGET ${target} PROPERTY COMPILE_DEFINITIONS)
    list(FIND _defs UNICODE isUnicode)
    if(NOT isUnicode EQUAL -1)
      set(unicode u)
    else()
      set(unicode "")
    endif()
    set_target_properties(${target} PROPERTIES
      OUTPUT_NAME ${target}${WX_VERSION}_${toolset}${unicode}${static}x
      DEBUG_OUTPUT_NAME ${target}${WX_VERSION}_${toolset}${unicode}${static}d
      RELEASE_OUTPUT_NAME ${target}${WX_VERSION}_${toolset}${unicode}${static}
      COMPILE_FLAGS /W1
      )
  else()
    get_target_property(target_defs ${target} COMPILE_DEFINITIONS)
    if(NOT target_defs)
      set(target_defs)
    endif()
    set_property(TARGET ${target} PROPERTY
      COMPILE_DEFINITIONS __WXMSW__ WXBUILDING UNICODE _UNICODE ${target_defs})
    set_property(TARGET ${target} PROPERTY FOLDER ${wxbasename}_libs)
    set_target_properties(${target} PROPERTIES
      OUTPUT_NAME ${wxbasename}${WX_VERSION}${toolset}u${static}x_${target}
      DEBUG_OUTPUT_NAME ${wxbasename}${WX_VERSION}${toolset}u${static}d_${target}
      RELEASE_OUTPUT_NAME ${wxbasename}${WX_VERSION}${toolset}u${static}_${target}
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
  install(TARGETS ${lib_name} EXPORT ${PROJECT_NAME}-targets
    RUNTIME DESTINATION bin
    LIBRARY DESTINATION lib
    ARCHIVE DESTINATION lib
    )
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
  wxscintilla
  wxtiff
  wxzlib
  ####
  base
  ####
  net
  xml
  core
  ####
  adv
  gl
  html
  media
  ribbon
  stc
  webview
  ####
  aui
  propgrid
  qa
  richtext
  xrc
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
  ${wxroot}/include/wx/meta
  ${wxroot}/include/wx/msw
  ${wxroot}/include/wx/persist
  ${wxroot}/include/wx/propgrid
  ${wxroot}/include/wx/protocol
  ${wxroot}/include/wx/ribbon
  ${wxroot}/include/wx/richtext
  ${wxroot}/include/wx/stc
  ${wxroot}/include/wx/xml
  ${wxroot}/include/wx/xrc
  DESTINATION include/${wxver}/wx
  PATTERN ".cvsignore" EXCLUDE
  )
install(FILES ${wxhdrs} ${wxcpps} DESTINATION include/${wxver}/wx)
set(customsetuph ${wxroot}/build/cmake/setup.h)
install(FILES ${customsetuph} DESTINATION include/${wxver}/wx/msvc/wx)
install(EXPORT ${PROJECT_NAME}-targets DESTINATION lib/cmake)
