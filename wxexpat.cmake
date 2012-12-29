set(lib_name wxexpat)
#######################################
# library sources
source_group("" FILES ${lib_name}.cmake)
list(APPEND ${lib_name}_libsrcs ${lib_name}.cmake)
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
get_directory_property(global_includes INCLUDE_DIRECTORIES)
set_property(TARGET ${lib_name} PROPERTY
  INCLUDE_DIRECTORIES ${global_includes} ${wxroot}/src/expat
  )
set_property(TARGET ${lib_name} PROPERTY
  COMPILE_DEFINITIONS COMPILED_FROM_DSP
  )
set_wxtarget_properties(${lib_name})