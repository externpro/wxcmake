set(lib_name wxjpeg)
#######################################
# library sources
set(thisfile ${wxroot}/build/cmake/${lib_name}.cmake)
source_group("" FILES ${thisfile})
list(APPEND ${lib_name}_libsrcs ${thisfile})
########################
# Source Files
set(Source_srcs
  ${wxroot}/src/jpeg/jcapimin.c
  ${wxroot}/src/jpeg/jcapistd.c
  ${wxroot}/src/jpeg/jccoefct.c
  ${wxroot}/src/jpeg/jccolor.c
  ${wxroot}/src/jpeg/jcdctmgr.c
  ${wxroot}/src/jpeg/jchuff.c
  ${wxroot}/src/jpeg/jcinit.c
  ${wxroot}/src/jpeg/jcmainct.c
  ${wxroot}/src/jpeg/jcmarker.c
  ${wxroot}/src/jpeg/jcmaster.c
  ${wxroot}/src/jpeg/jcomapi.c
  ${wxroot}/src/jpeg/jcparam.c
  ${wxroot}/src/jpeg/jcphuff.c
  ${wxroot}/src/jpeg/jcprepct.c
  ${wxroot}/src/jpeg/jcsample.c
  ${wxroot}/src/jpeg/jctrans.c
  ${wxroot}/src/jpeg/jdapimin.c
  ${wxroot}/src/jpeg/jdapistd.c
  ${wxroot}/src/jpeg/jdatadst.c
  ${wxroot}/src/jpeg/jdatasrc.c
  ${wxroot}/src/jpeg/jdcoefct.c
  ${wxroot}/src/jpeg/jdcolor.c
  ${wxroot}/src/jpeg/jddctmgr.c
  ${wxroot}/src/jpeg/jdhuff.c
  ${wxroot}/src/jpeg/jdinput.c
  ${wxroot}/src/jpeg/jdmainct.c
  ${wxroot}/src/jpeg/jdmarker.c
  ${wxroot}/src/jpeg/jdmaster.c
  ${wxroot}/src/jpeg/jdmerge.c
  ${wxroot}/src/jpeg/jdphuff.c
  ${wxroot}/src/jpeg/jdpostct.c
  ${wxroot}/src/jpeg/jdsample.c
  ${wxroot}/src/jpeg/jdtrans.c
  ${wxroot}/src/jpeg/jerror.c
  ${wxroot}/src/jpeg/jfdctflt.c
  ${wxroot}/src/jpeg/jfdctfst.c
  ${wxroot}/src/jpeg/jfdctint.c
  ${wxroot}/src/jpeg/jidctflt.c
  ${wxroot}/src/jpeg/jidctfst.c
  ${wxroot}/src/jpeg/jidctint.c
  ${wxroot}/src/jpeg/jidctred.c
  ${wxroot}/src/jpeg/jmemmgr.c
  ${wxroot}/src/jpeg/jmemnobs.c
  ${wxroot}/src/jpeg/jquant1.c
  ${wxroot}/src/jpeg/jquant2.c
  ${wxroot}/src/jpeg/jutils.c
  )
source_group("Source Files" FILES ${Source_srcs})
list(APPEND ${lib_name}_libsrcs ${Source_srcs})
#######################################
# library
add_library(${lib_name} STATIC ${${lib_name}_libsrcs})
set_wxtarget_properties(${lib_name})