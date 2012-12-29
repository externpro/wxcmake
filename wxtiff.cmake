set(lib_name wxtiff)
#######################################
# library sources
source_group("" FILES ${lib_name}.cmake)
list(APPEND ${lib_name}_libsrcs ${lib_name}.cmake)
########################
# Source Files
set(Source_srcs
  ${wxroot}/src/tiff/tif_aux.c
  ${wxroot}/src/tiff/tif_close.c
  ${wxroot}/src/tiff/tif_codec.c
  ${wxroot}/src/tiff/tif_color.c
  ${wxroot}/src/tiff/tif_compress.c
  ${wxroot}/src/tiff/tif_dir.c
  ${wxroot}/src/tiff/tif_dirinfo.c
  ${wxroot}/src/tiff/tif_dirread.c
  ${wxroot}/src/tiff/tif_dirwrite.c
  ${wxroot}/src/tiff/tif_dumpmode.c
  ${wxroot}/src/tiff/tif_error.c
  ${wxroot}/src/tiff/tif_extension.c
  ${wxroot}/src/tiff/tif_fax3.c
  ${wxroot}/src/tiff/tif_fax3sm.c
  ${wxroot}/src/tiff/tif_flush.c
  ${wxroot}/src/tiff/tif_getimage.c
  ${wxroot}/src/tiff/tif_jpeg.c
  ${wxroot}/src/tiff/tif_luv.c
  ${wxroot}/src/tiff/tif_lzw.c
  ${wxroot}/src/tiff/tif_next.c
  ${wxroot}/src/tiff/tif_open.c
  ${wxroot}/src/tiff/tif_packbits.c
  ${wxroot}/src/tiff/tif_pixarlog.c
  ${wxroot}/src/tiff/tif_predict.c
  ${wxroot}/src/tiff/tif_print.c
  ${wxroot}/src/tiff/tif_read.c
  ${wxroot}/src/tiff/tif_strip.c
  ${wxroot}/src/tiff/tif_swab.c
  ${wxroot}/src/tiff/tif_thunder.c
  ${wxroot}/src/tiff/tif_tile.c
  ${wxroot}/src/tiff/tif_version.c
  ${wxroot}/src/tiff/tif_warning.c
  ${wxroot}/src/tiff/tif_win32.c
  ${wxroot}/src/tiff/tif_write.c
  ${wxroot}/src/tiff/tif_zip.c
  )
source_group("Source Files" FILES ${Source_srcs})
list(APPEND ${lib_name}_libsrcs ${Source_srcs})
#######################################
# library
add_library(${lib_name} STATIC ${${lib_name}_libsrcs})
set_wxtarget_properties(${lib_name})