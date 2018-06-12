set(lib_name wxexpat)
#######################################
# library sources
set(thisfile ${wxroot}/build/cmake/${lib_name}.cmake)
source_group("" FILES ${thisfile})
list(APPEND ${lib_name}_libsrcs ${thisfile})
########################
# Source Files
set(Source_srcs
  ${wxroot}/src/expat/lib/xmlparse.c
  ${wxroot}/src/expat/lib/xmlrole.c
  ${wxroot}/src/expat/lib/xmltok.c
  )
source_group("Source Files" FILES ${Source_srcs})
list(APPEND ${lib_name}_libsrcs ${Source_srcs})
#######################################
# library
add_library(${lib_name} STATIC ${${lib_name}_libsrcs})
target_include_directories(${lib_name} PUBLIC $<BUILD_INTERFACE:${wxroot}/src/expat/lib>
  PRIVATE ${wxroot}/src/expat
  )
target_compile_definitions(${lib_name} PRIVATE COMPILED_FROM_DSP)
set_wxtarget_properties(${lib_name})
