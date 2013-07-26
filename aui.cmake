set(lib_name aui)
#######################################
# library sources
set(thisfile ${wxroot}/build/cmake/${lib_name}.cmake)
source_group("" FILES ${thisfile})
list(APPEND ${lib_name}_libsrcs ${thisfile})
########################
# Common Headers
set(Common_hdrs
  ${wxroot}/include/wx/aui/aui.h
  ${wxroot}/include/wx/aui/auibar.h
  ${wxroot}/include/wx/aui/auibook.h
  ${wxroot}/include/wx/aui/dockart.h
  ${wxroot}/include/wx/aui/floatpane.h
  ${wxroot}/include/wx/aui/framemanager.h
  ${wxroot}/include/wx/aui/tabart.h
  ${wxroot}/include/wx/aui/tabmdi.h
  )
source_group("Common Headers" FILES ${Common_hdrs})
list(APPEND ${lib_name}_libsrcs ${Common_hdrs})
########################
# Common Sources
set(Common_srcs
  ${wxroot}/src/common/dummy.cpp
  )
source_group("Common Sources" FILES ${Common_srcs})
list(APPEND ${lib_name}_libsrcs ${Common_srcs})
########################
# MSW Headers
set(MSW_hdrs
  ${wxroot}/include/wx/msw/genrcdefs.h
  )
source_group("MSW Headers" FILES ${MSW_hdrs})
list(APPEND ${lib_name}_libsrcs ${MSW_hdrs})
########################
# MSW Sources
set(MSW_srcs
  #${wxroot}/src/msw/version.rc
  )
source_group("MSW Sources" FILES ${MSW_srcs})
list(APPEND ${lib_name}_libsrcs ${MSW_srcs})
########################
# Setup Headers
set(Setup_hdrs
  ${wxroot}/include/wx/msw/setup.h
  ${wxroot}/include/wx/univ/setup.h
  )
source_group("Setup Headers" FILES ${Setup_hdrs})
list(APPEND ${lib_name}_libsrcs ${Setup_hdrs})
########################
# Source Files
set(Source_srcs
  ${wxroot}/src/aui/auibar.cpp
  ${wxroot}/src/aui/auibook.cpp
  ${wxroot}/src/aui/dockart.cpp
  ${wxroot}/src/aui/floatpane.cpp
  ${wxroot}/src/aui/framemanager.cpp
  ${wxroot}/src/aui/tabart.cpp
  ${wxroot}/src/aui/tabmdi.cpp
  )
source_group("Source Files" FILES ${Source_srcs})
list(APPEND ${lib_name}_libsrcs ${Source_srcs})
#######################################
# library
add_library(${lib_name} STATIC ${${lib_name}_libsrcs})
set_wxtarget_properties(${lib_name})
