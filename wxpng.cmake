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
########################
set(arm_srcs
  ${wxroot}/src/png/arm/arm_init.c
  ${wxroot}/src/png/arm/filter_neon_intrinsics.c
  ${wxroot}/src/png/arm/filter_neon.S
  )
source_group("Arm Source Files" FILES ${arm_srcs})
list(APPEND ${lib_name}_libsrcs ${arm_srcs})
#######################################
# library
add_library(${lib_name} STATIC ${${lib_name}_libsrcs})
target_include_directories(${lib_name} PUBLIC $<BUILD_INTERFACE:${wxroot}/src/png>)
target_link_libraries(${lib_name} PRIVATE wxzlib)
set_wxtarget_properties(${lib_name})
