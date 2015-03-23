# WXWIDGETS_FOUND - wxwidgets was found
# WXWIDGETS_INCLUDE_DIR - the wxwidgets include directory
# WXWIDGETS_LIBRARIES - the wxwidgets libraries
set(prj wxwidgets)
# this file (-config) installed to share/cmake
get_filename_component(XP_ROOTDIR ${CMAKE_CURRENT_LIST_DIR}/../.. ABSOLUTE)
get_filename_component(XP_ROOTDIR ${XP_ROOTDIR} ABSOLUTE) # remove relative parts
string(TOUPPER ${prj} PRJ)
set(XP_USE_LATEST_WX ON)
#option(XP_USE_LATEST_WX "build with wxWidgets 3.0 instead of 2.8" ON)
if(XP_USE_LATEST_WX)
  set(wxVersion "3.0")
else()
  set(wxVersion "2.8")
endif()
# NOTE: geotiff needs to find tiff, and we use the tiff bundled with wx
list(APPEND ${PRJ}_INCLUDE_DIR ${XP_ROOTDIR}/include/wx-${wxVersion}/wx/tiff)
if(UNIX)
  set(wxWidgets_CONFIG_OPTIONS --prefix=${XP_ROOTDIR} --version=${wxVersion})
  unset(wxWidgets_CONFIG_EXECUTABLE CACHE)
  set(wxWidgets_CONFIG_EXECUTABLE ${XP_ROOTDIR}/bin/wx-config)
  if(NOT DEFINED wx_libs)
    # http://docs.wxwidgets.org/trunk/page_libs.html
    # TRICKY: reverse dependency order (base should be last)
    set(wx_libs aui richtext adv html core net xml base)
  endif()
  find_package(wxWidgets REQUIRED ${wx_libs})
  include(${wxWidgets_USE_FILE})
  #set(wx_DEBUG TRUE)
  if(wx_DEBUG)
    message(STATUS "wxWidgets_USE_FILE: ${wxWidgets_USE_FILE}")
    message(STATUS "wxWidgets_INCLUDE_DIRS: ${wxWidgets_INCLUDE_DIRS}")
    message(STATUS "wxWidgets_LIBRARIES: ${wxWidgets_LIBRARIES}")
    message(STATUS "wxWidgets_LIBRARY_DIRS: ${wxWidgets_LIBRARY_DIRS}")
    message(STATUS "wxWidgets_DEFINITIONS: ${wxWidgets_DEFINITIONS}")
    message(STATUS "wxWidgets_CXX_FLAGS: ${wxWidgets_CXX_FLAGS}")
  endif()
  mark_as_advanced(wxWidgets_USE_DEBUG)
  mark_as_advanced(wxWidgets_wxrc_EXECUTABLE)
  list(APPEND ${PRJ}_INCLUDE_DIR ${wxWidgets_INCLUDE_DIRS})
  set(${PRJ}_LIBRARIES ${wxWidgets_LIBRARIES})
  execute_process(COMMAND sh "${wxWidgets_CONFIG_EXECUTABLE}" --prefix=${XP_ROOTDIR}
    --version=${wxVersion} --version
    OUTPUT_VARIABLE wxver OUTPUT_STRIP_TRAILING_WHITESPACE ERROR_QUIET
    )
  message(STATUS "wxWidgets version: ${wxver}")
  ############################
  # wxx
  execute_process(COMMAND sh "${wxWidgets_CONFIG_EXECUTABLE}" --prefix=${XP_ROOTDIR}
    --version=${wxVersion} --basename
    OUTPUT_VARIABLE wxbasename OUTPUT_STRIP_TRAILING_WHITESPACE ERROR_QUIET
    )
  string(REPLACE "wx_" "wxx_" wxbasename ${wxbasename})
  foreach(lib plotctrl things tlc)
    set(wxx${lib}_LIBRARIES
      optimized ${wxbasename}_${lib}-${wxVersion}
      debug ${wxbasename}d_${lib}-${wxVersion}
      )
  endforeach()
  ############################
  # GTK2
  if(NOT ${CMAKE_SYSTEM_NAME} STREQUAL Darwin)
    if(${CMAKE_SYSTEM_NAME} STREQUAL Linux)
      set(GTK2_ADDITIONAL_SUFFIXES x86_64-linux-gnu/glib-2.0)
    endif()
    find_package(PkgConfig)
    pkg_check_modules(GTK2 REQUIRED gtk+-2.0)
    if(GTK2_FOUND)
      list(APPEND ${PRJ}_INCLUDE_DIR ${GTK2_INCLUDE_DIRS})
    else()
      message(SEND_ERROR "GTK2 not found")
    endif()
  endif()
  set(reqVars ${PRJ}_INCLUDE_DIR ${PRJ}_LIBRARIES)
elseif(MSVC)
  add_definitions(-DwxUSE_NO_MANIFEST)
  list(APPEND ${PRJ}_INCLUDE_DIR
    ${XP_ROOTDIR}/include/wx-${wxVersion}
    ${XP_ROOTDIR}/include/wx-${wxVersion}/wx/msvc
    )
  # targets file (-targets) installed to lib${NUMBITS}/cmake
  include(${XP_ROOTDIR}/lib${NUMBITS}/cmake/${prj}-targets.cmake)
  set(reqVars ${PRJ}_INCLUDE_DIR)
endif()
include_directories(SYSTEM ${${PRJ}_INCLUDE_DIR})
include(FindPackageHandleStandardArgs)
find_package_handle_standard_args(${prj} REQUIRED_VARS ${reqVars})
mark_as_advanced(${reqVars})
