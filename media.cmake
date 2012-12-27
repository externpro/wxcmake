set(lib_name media)
#######################################
# library sources
source_group("" FILES ${lib_name}.cmake)
list(APPEND ${lib_name}_libsrcs ${lib_name}.cmake)
########################
# Common Headers
set(Common_hdrs
  ${wxroot}/include/wx/mediactrl.h
  )
source_group("Common Headers" FILES ${Common_hdrs})    
list(APPEND ${lib_name}_libsrcs ${Common_hdrs})
########################
# Common Sources
set(Common_srcs
  ${wxroot}/src/common/dummy.cpp
  ${wxroot}/src/common/mediactrlcmn.cpp
  )
source_group("Common Sources" FILES ${Common_srcs})
list(APPEND ${lib_name}_libsrcs ${Common_srcs})
########################
# MSW Headers
set(MSW_hdrs
  ${wxroot}/include/wx/msw/ole/activex.h
  ${wxroot}/include/wx/msw/genrcdefs.h
  )
source_group("MSW Headers" FILES ${MSW_hdrs})
list(APPEND ${lib_name}_libsrcs ${MSW_hdrs})
########################
# MSW Sources
set(MSW_srcs
  ${wxroot}/src/msw/ole/activex.cpp
  ${wxroot}/src/msw/mediactrl_am.cpp
  ${wxroot}/src/msw/mediactrl_qt.cpp
  ${wxroot}/src/msw/mediactrl_wmp10.cpp
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
#######################################
# library
add_library(${lib_name} STATIC ${${lib_name}_libsrcs})
set_target_properties(${lib_name}
  PROPERTIES OUTPUT_NAME ${wxbasename}${wxversion}_${lib_name}
  )
