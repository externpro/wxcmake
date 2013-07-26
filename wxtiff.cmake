set(lib_name wxtiff)
#######################################
# library sources
set(thisfile ${wxroot}/build/cmake/${lib_name}.cmake)
source_group("" FILES ${thisfile})
list(APPEND ${lib_name}_libsrcs ${thisfile})
########################
# Source Files
set(Source_srcs
  ${wxroot}/src/tiff/libtiff/tif_aux.c
  ${wxroot}/src/tiff/libtiff/tif_close.c
  ${wxroot}/src/tiff/libtiff/tif_codec.c
  ${wxroot}/src/tiff/libtiff/tif_color.c
  ${wxroot}/src/tiff/libtiff/tif_compress.c
  ${wxroot}/src/tiff/libtiff/tif_dir.c
  ${wxroot}/src/tiff/libtiff/tif_dirinfo.c
  ${wxroot}/src/tiff/libtiff/tif_dirread.c
  ${wxroot}/src/tiff/libtiff/tif_dirwrite.c
  ${wxroot}/src/tiff/libtiff/tif_dumpmode.c
  ${wxroot}/src/tiff/libtiff/tif_error.c
  ${wxroot}/src/tiff/libtiff/tif_extension.c
  ${wxroot}/src/tiff/libtiff/tif_fax3.c
  ${wxroot}/src/tiff/libtiff/tif_fax3sm.c
  ${wxroot}/src/tiff/libtiff/tif_flush.c
  ${wxroot}/src/tiff/libtiff/tif_getimage.c
  ${wxroot}/src/tiff/libtiff/tif_jpeg.c
  ${wxroot}/src/tiff/libtiff/tif_luv.c
  ${wxroot}/src/tiff/libtiff/tif_lzw.c
  ${wxroot}/src/tiff/libtiff/tif_next.c
  ${wxroot}/src/tiff/libtiff/tif_ojpeg.c
  ${wxroot}/src/tiff/libtiff/tif_open.c
  ${wxroot}/src/tiff/libtiff/tif_packbits.c
  ${wxroot}/src/tiff/libtiff/tif_pixarlog.c
  ${wxroot}/src/tiff/libtiff/tif_predict.c
  ${wxroot}/src/tiff/libtiff/tif_print.c
  ${wxroot}/src/tiff/libtiff/tif_read.c
  ${wxroot}/src/tiff/libtiff/tif_strip.c
  ${wxroot}/src/tiff/libtiff/tif_swab.c
  ${wxroot}/src/tiff/libtiff/tif_thunder.c
  ${wxroot}/src/tiff/libtiff/tif_tile.c
  ${wxroot}/src/tiff/libtiff/tif_version.c
  ${wxroot}/src/tiff/libtiff/tif_warning.c
  ${wxroot}/src/tiff/libtiff/tif_win32.c
  ${wxroot}/src/tiff/libtiff/tif_write.c
  ${wxroot}/src/tiff/libtiff/tif_zip.c
  )
source_group("Source Files" FILES ${Source_srcs})
list(APPEND ${lib_name}_libsrcs ${Source_srcs})
#######################################
# library
add_library(${lib_name} STATIC ${${lib_name}_libsrcs})
set_wxtarget_properties(${lib_name})
