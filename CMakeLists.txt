cmake_minimum_required(VERSION 2.8)
project(wxwidgets)
set(CMAKE_MODULE_PATH ${wxwidgets_SOURCE_DIR} ${CMAKE_MODULE_PATH})
include(flags OPTIONAL)
include(cmakeutils) # needs to be after flags (to unset CMAKE_*_POSTFIX)
set(LIBRARY_OUTPUT_PATH ${CMAKE_BINARY_DIR}/lib${NUMBITS})
set(wxroot ${wxwidgets_SOURCE_DIR}/../..)
include_directories(${wxroot}/include ${LIBRARY_OUTPUT_PATH})
set_property(GLOBAL PROPERTY USE_FOLDERS ON) # enables MSVC Solution Folders
#######################################
# setup.h
set(wxsetup ${wxroot}/include/wx/msw/setup.h)
if(NOT EXISTS ${LIBRARY_OUTPUT_PATH}/wx)
  execute_process(COMMAND ${CMAKE_COMMAND} -E make_directory
    ${LIBRARY_OUTPUT_PATH}/wx)
endif()
execute_process(COMMAND ${CMAKE_COMMAND} -E copy_if_different
  ${wxsetup} ${LIBRARY_OUTPUT_PATH}/wx)
#######################################
# wx libraries
set(wxlibs
  base
  core
  net
  xml
  html
  adv
  dbgrid
  odbc
  aui
  gl
  media
  qa
  richtext
  xrc
  wxexpat
  wxjpeg
  wxpng
  wxregex
  wxtiff
  wxzlib
  )
foreach(lib ${wxlibs})
  include(${lib})
endforeach()