cmake_minimum_required(VERSION 2.8)
project(wxwidgets)
set(wxroot ${wxwidgets_SOURCE_DIR}/../..)
set(CMAKE_MODULE_PATH ${wxwidgets_SOURCE_DIR} ${CMAKE_MODULE_PATH})
set(wxbasename wxmsw)
set(wxversion 28)
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

