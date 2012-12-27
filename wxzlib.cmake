set(lib_name wxzlib)
#######################################
# library sources
source_group("" FILES ${lib_name}.cmake)
list(APPEND ${lib_name}_libsrcs ${lib_name}.cmake)
########################
# Source Files
set(Source_srcs
  ${wxroot}/src/zlib/adler32.c
  ${wxroot}/src/zlib/compress.c
  ${wxroot}/src/zlib/crc32.c
  ${wxroot}/src/zlib/deflate.c
  ${wxroot}/src/zlib/gzio.c
  ${wxroot}/src/zlib/infback.c
  ${wxroot}/src/zlib/inffast.c
  ${wxroot}/src/zlib/inflate.c
  ${wxroot}/src/zlib/inftrees.c
  ${wxroot}/src/zlib/trees.c
  ${wxroot}/src/zlib/uncompr.c
  ${wxroot}/src/zlib/zutil.c
  )
source_group("Source Files" FILES ${Source_srcs}) 
list(APPEND ${lib_name}_libsrcs ${Source_srcs})
#######################################
# library
add_library(${lib_name} STATIC ${${lib_name}_libsrcs})
set_target_properties(${lib_name}
  PROPERTIES OUTPUT_NAME ${wxbasename}${wxversion}_${lib_name}
  )
