set(lib_name wxregex)
#######################################
# library sources
set(thisfile ${wxroot}/build/cmake/${lib_name}.cmake)
source_group("" FILES ${thisfile})
list(APPEND ${lib_name}_libsrcs ${thisfile})
########################
# Header Files
set(Header_srcs
  ${wxroot}/include/wx/msw/genrcdefs.h
  ${wxroot}/include/wx/msw/setup.h
  ${wxroot}/include/wx/univ/setup.h
  )
source_group("Header Files" FILES ${Header_srcs})
list(APPEND ${lib_name}_libsrcs ${Header_srcs})
########################
# Source Files
set(Source_srcs
  ${wxroot}/src/regex/regcomp.c
  ${wxroot}/src/regex/regerror.c
  ${wxroot}/src/regex/regexec.c
  ${wxroot}/src/regex/regfree.c
  )
source_group("Source Files" FILES ${Source_srcs})
list(APPEND ${lib_name}_libsrcs ${Source_srcs})
#######################################
# library
add_library(${lib_name} STATIC ${${lib_name}_libsrcs})
set_property(TARGET ${lib_name} PROPERTY
  COMPILE_DEFINITIONS __WXMSW__
  )
set_wxtarget_properties(${lib_name})