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
target_compile_definitions(${lib_name} PRIVATE __WXMSW__ UNICODE _UNICODE)
target_include_directories(${lib_name} PUBLIC $<BUILD_INTERFACE:${wxroot}/src/regex>
  PRIVATE ${wxroot}/include ${LIBRARY_OUTPUT_PATH} # find setup.h
  )
set_wxtarget_properties(${lib_name})
