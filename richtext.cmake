set(lib_name richtext)
#######################################
# library sources
source_group("" FILES ${lib_name}.cmake)
list(APPEND ${lib_name}_libsrcs ${lib_name}.cmake)
########################
# Common Headers
set(Common_hdrs
  ${wxroot}/include/wx/richtext/richtextbuffer.h
  ${wxroot}/include/wx/richtext/richtextctrl.h
  ${wxroot}/include/wx/richtext/richtextformatdlg.h
  ${wxroot}/include/wx/richtext/richtexthtml.h
  ${wxroot}/include/wx/richtext/richtextprint.h
  ${wxroot}/include/wx/richtext/richtextstyledlg.h
  ${wxroot}/include/wx/richtext/richtextstyles.h
  ${wxroot}/include/wx/richtext/richtextsymboldlg.h
  ${wxroot}/include/wx/richtext/richtextxml.h
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
  ${wxroot}/src/msw/version.rc
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
  ${wxroot}/src/richtext/richtextbuffer.cpp
  ${wxroot}/src/richtext/richtextctrl.cpp
  ${wxroot}/src/richtext/richtextformatdlg.cpp
  ${wxroot}/src/richtext/richtexthtml.cpp
  ${wxroot}/src/richtext/richtextprint.cpp
  ${wxroot}/src/richtext/richtextstyledlg.cpp
  ${wxroot}/src/richtext/richtextstyles.cpp
  ${wxroot}/src/richtext/richtextsymboldlg.cpp
  ${wxroot}/src/richtext/richtextxml.cpp
  )
source_group("Source Files" FILES ${Source_srcs})
list(APPEND ${lib_name}_libsrcs ${Source_srcs})
#######################################
# library
add_library(${lib_name} STATIC ${${lib_name}_libsrcs})
set_target_properties(${lib_name}
  PROPERTIES OUTPUT_NAME ${wxbasename}${wxversion}_${lib_name}
  )
