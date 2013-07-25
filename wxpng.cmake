set(lib_name wxpng)
#######################################
# library sources
set(thisfile ${wxroot}/build/cmake/${lib_name}.cmake)
source_group("" FILES ${thisfile})
list(APPEND ${lib_name}_libsrcs ${thisfile})
########################
# Source Files
set(Source_srcs
  ${wxroot}/src/png/png.c
  ${wxroot}/src/png/pngerror.c
  ${wxroot}/src/png/pngget.c
  ${wxroot}/src/png/pngmem.c
  ${wxroot}/src/png/pngpread.c
  ${wxroot}/src/png/pngread.c
  ${wxroot}/src/png/pngrio.c
  ${wxroot}/src/png/pngrtran.c
  ${wxroot}/src/png/pngrutil.c
  ${wxroot}/src/png/pngset.c
  ${wxroot}/src/png/pngtrans.c
  ${wxroot}/src/png/pngwio.c
  ${wxroot}/src/png/pngwrite.c
  ${wxroot}/src/png/pngwtran.c
  ${wxroot}/src/png/pngwutil.c
  )
source_group("Source Files" FILES ${Source_srcs})
list(APPEND ${lib_name}_libsrcs ${Source_srcs})
#######################################
# library
add_library(${lib_name} STATIC ${${lib_name}_libsrcs})
get_directory_property(global_includes INCLUDE_DIRECTORIES)
set_property(TARGET ${lib_name} PROPERTY
  INCLUDE_DIRECTORIES ${global_includes} ${wxroot}/src/zlib
  )
set_wxtarget_properties(${lib_name})
