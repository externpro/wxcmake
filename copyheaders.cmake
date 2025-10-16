install(FILES ${CMAKE_SOURCE_DIR}/include/wx/msw/winundef.h DESTINATION ${wxIncDir}/externpro)
set(tiffHdrs "src/tiff/libtiff/*.h")
file(GLOB srcTiffHdrs "${CMAKE_SOURCE_DIR}/${tiffHdrs}")
install(FILES ${srcTiffHdrs} DESTINATION ${wxIncDir}/wx/tiff)
# TRICKY: install tiff .h files from BINARY_DIR on non-msw, configure-built platforms
file(GLOB binTiffHdrs "${BINARY_DIR}/${tiffHdrs}") # BINARY_DIR set in configure.cmake
install(FILES ${binTiffHdrs} DESTINATION ${wxIncDir}/wx/tiff)
