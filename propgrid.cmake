set(lib_name propgrid)
#######################################
# library sources
set(thisfile ${wxroot}/build/cmake/${lib_name}.cmake)
source_group("" FILES ${thisfile})
list(APPEND ${lib_name}_libsrcs ${thisfile})
########################
# Common Headers
set(Common_hdrs
  ${wxroot}/include/wx/propgrid/advprops.h
  ${wxroot}/include/wx/propgrid/editors.h
  ${wxroot}/include/wx/propgrid/manager.h
  ${wxroot}/include/wx/propgrid/property.h
  ${wxroot}/include/wx/propgrid/propgrid.h
  ${wxroot}/include/wx/propgrid/propgriddefs.h
  ${wxroot}/include/wx/propgrid/propgridiface.h
  ${wxroot}/include/wx/propgrid/propgridpagestate.h
  ${wxroot}/include/wx/propgrid/props.h
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
  )
source_group("Setup Headers" FILES ${Setup_hdrs})
list(APPEND ${lib_name}_libsrcs ${Setup_hdrs})
########################
# Source Files
set(Source_srcs
  ${wxroot}/src/propgrid/advprops.cpp
  ${wxroot}/src/propgrid/editors.cpp
  ${wxroot}/src/propgrid/manager.cpp
  ${wxroot}/src/propgrid/property.cpp
  ${wxroot}/src/propgrid/propgrid.cpp
  ${wxroot}/src/propgrid/propgridiface.cpp
  ${wxroot}/src/propgrid/propgridpagestate.cpp
  ${wxroot}/src/propgrid/props.cpp
  )
source_group("Source Files" FILES ${Source_srcs})
list(APPEND ${lib_name}_libsrcs ${Source_srcs})
#######################################
# library
add_library(${lib_name} STATIC ${${lib_name}_libsrcs})
set_wxtarget_properties(${lib_name})
