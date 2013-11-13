set(lib_name ribbon)
#######################################
# library sources
set(thisfile ${wxroot}/build/cmake/${lib_name}.cmake)
source_group("" FILES ${thisfile})
list(APPEND ${lib_name}_libsrcs ${thisfile})
########################
# Common Headers
set(Common_hdrs
  ${wxroot}/include/wx/ribbon/art.h
  ${wxroot}/include/wx/ribbon/art_internal.h
  ${wxroot}/include/wx/ribbon/bar.h
  ${wxroot}/include/wx/ribbon/buttonbar.h
  ${wxroot}/include/wx/ribbon/control.h
  ${wxroot}/include/wx/ribbon/gallery.h
  ${wxroot}/include/wx/ribbon/page.h
  ${wxroot}/include/wx/ribbon/panel.h
  ${wxroot}/include/wx/ribbon/toolbar.h
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
  ${wxroot}/src/ribbon/art_aui.cpp
  ${wxroot}/src/ribbon/art_internal.cpp
  ${wxroot}/src/ribbon/art_msw.cpp
  ${wxroot}/src/ribbon/bar.cpp
  ${wxroot}/src/ribbon/buttonbar.cpp
  ${wxroot}/src/ribbon/control.cpp
  ${wxroot}/src/ribbon/gallery.cpp
  ${wxroot}/src/ribbon/page.cpp
  ${wxroot}/src/ribbon/panel.cpp
  ${wxroot}/src/ribbon/toolbar.cpp
  )
source_group("Source Files" FILES ${Source_srcs})
list(APPEND ${lib_name}_libsrcs ${Source_srcs})
#######################################
# library
add_library(${lib_name} STATIC ${${lib_name}_libsrcs})
set_wxtarget_properties(${lib_name})
