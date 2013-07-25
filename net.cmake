set(lib_name net)
#######################################
# library sources
set(thisfile ${wxroot}/build/cmake/${lib_name}.cmake)
source_group("" FILES ${thisfile})
list(APPEND ${lib_name}_libsrcs ${thisfile})
########################
# Common Headers
set(Common_hdrs
  ${wxroot}/include/wx/protocol/file.h
  ${wxroot}/include/wx/fs_inet.h
  ${wxroot}/include/wx/protocol/ftp.h
  ${wxroot}/include/wx/protocol/http.h
  ${wxroot}/include/wx/protocol/log.h
  ${wxroot}/include/wx/protocol/protocol.h
  ${wxroot}/include/wx/sckaddr.h
  ${wxroot}/include/wx/sckipc.h
  ${wxroot}/include/wx/sckstrm.h
  ${wxroot}/include/wx/socket.h
  ${wxroot}/include/wx/url.h
  )
source_group("Common Headers" FILES ${Common_hdrs})
list(APPEND ${lib_name}_libsrcs ${Common_hdrs})
########################
# Common Sources
set(Common_srcs
  ${wxroot}/src/common/dummy.cpp
  ${wxroot}/src/common/fs_inet.cpp
  ${wxroot}/src/common/ftp.cpp
  ${wxroot}/src/common/http.cpp
  ${wxroot}/src/common/protocol.cpp
  ${wxroot}/src/common/sckaddr.cpp
  ${wxroot}/src/common/sckfile.cpp
  ${wxroot}/src/common/sckipc.cpp
  ${wxroot}/src/common/sckstrm.cpp
  ${wxroot}/src/common/socket.cpp
  ${wxroot}/src/common/url.cpp
  )
source_group("Common Sources" FILES ${Common_srcs})
list(APPEND ${lib_name}_libsrcs ${Common_srcs})
########################
# MSW Headers
set(MSW_hdrs
  ${wxroot}/include/wx/msw/genrcdefs.h
  )
source_group("MSW Headers" FILES ${MSW_hdrs})
list(APPEND ${lib_name}_libsrcs ${MSW_hdrs})
########################
# MSW Sources
set(MSW_srcs
  ${wxroot}/src/msw/sockmsw.cpp
  ${wxroot}/src/msw/urlmsw.cpp
  ${wxroot}/src/msw/version.rc
  )
source_group("MSW Sources" FILES ${MSW_srcs})
list(APPEND ${lib_name}_libsrcs ${MSW_srcs})
########################
# Setup Headers
set(Setup_hdrs
  ${wxroot}/include/wx/msw/setup.h
  ${wxroot}/include/wx/univ/setup.h
  )
source_group("Setup Headers" FILES ${Setup_hdrs})
list(APPEND ${lib_name}_libsrcs ${Setup_hdrs})
#######################################
# library
add_library(${lib_name} STATIC ${${lib_name}_libsrcs})
set_wxtarget_properties(${lib_name})
