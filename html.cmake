set(lib_name html)
#######################################
# library sources
source_group("" FILES ${lib_name}.cmake)
list(APPEND ${lib_name}_libsrcs ${lib_name}.cmake)
########################
# Common Headers
set(Common_hdrs
  ${wxroot}/include/wx/htmllbox.h
  ${wxroot}/include/wx/wxhtml.h
  )
source_group("Common Headers" FILES ${Common_hdrs})
list(APPEND ${lib_name}_libsrcs ${Common_hdrs})
########################
# Common Sources
set(Common_srcs
  ${wxroot}/src/common/dummy.cpp
  )
source_group("Common Sources" FILES ${Common_srcs})
list(APPEND ${lib_name}_libsrcs ${Common_srcs})
########################
# Generic Sources
set(Generic_srcs
  ${wxroot}/src/generic/htmllbox.cpp
  )
source_group("Generic Sources" FILES ${Generic_srcs})
list(APPEND ${lib_name}_libsrcs ${Generic_srcs})
########################
# MSW Headers
set(MSW_hdrs
  ${wxroot}/include/wx/msw/genrcdefs.h
  ${wxroot}/include/wx/msw/helpbest.h
  )
source_group("MSW Headers" FILES ${MSW_hdrs})
list(APPEND ${lib_name}_libsrcs ${MSW_hdrs})
########################
# MSW Sources
set(MSW_srcs
  ${wxroot}/src/msw/helpbest.cpp
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
########################
# wxHTML Headers
set(wxHTML_hdrs
  ${wxroot}/include/wx/html/helpctrl.h
  ${wxroot}/include/wx/html/helpdata.h
  ${wxroot}/include/wx/html/helpdlg.h
  ${wxroot}/include/wx/html/helpfrm.h
  ${wxroot}/include/wx/html/helpwnd.h
  ${wxroot}/include/wx/html/htmlcell.h
  ${wxroot}/include/wx/html/htmldefs.h
  ${wxroot}/include/wx/html/htmlfilt.h
  ${wxroot}/include/wx/html/htmlpars.h
  ${wxroot}/include/wx/html/htmlproc.h
  ${wxroot}/include/wx/html/htmltag.h
  ${wxroot}/include/wx/html/htmlwin.h
  ${wxroot}/include/wx/html/htmprint.h
  ${wxroot}/include/wx/html/m_templ.h
  ${wxroot}/include/wx/html/winpars.h
  )
source_group("wxHTML Headers" FILES ${wxHTML_hdrs})
list(APPEND ${lib_name}_libsrcs ${wxHTML_hdrs})
########################
# wxHTML Sources
set(wxHTML_srcs
  ${wxroot}/src/html/helpctrl.cpp
  ${wxroot}/src/html/helpdata.cpp
  ${wxroot}/src/html/helpdlg.cpp
  ${wxroot}/src/html/helpfrm.cpp
  ${wxroot}/src/html/helpwnd.cpp
  ${wxroot}/src/html/htmlcell.cpp
  ${wxroot}/src/html/htmlfilt.cpp
  ${wxroot}/src/html/htmlpars.cpp
  ${wxroot}/src/html/htmltag.cpp
  ${wxroot}/src/html/htmlwin.cpp
  ${wxroot}/src/html/htmprint.cpp
  ${wxroot}/src/html/m_dflist.cpp
  ${wxroot}/src/html/m_fonts.cpp
  ${wxroot}/src/html/m_hline.cpp
  ${wxroot}/src/html/m_image.cpp
  ${wxroot}/src/html/m_layout.cpp
  ${wxroot}/src/html/m_links.cpp
  ${wxroot}/src/html/m_list.cpp
  ${wxroot}/src/html/m_pre.cpp
  ${wxroot}/src/html/m_style.cpp
  ${wxroot}/src/html/m_tables.cpp
  ${wxroot}/src/html/winpars.cpp
  )
source_group("wxHTML Sources" FILES ${wxHTML_srcs})
list(APPEND ${lib_name}_libsrcs ${wxHTML_srcs})
#######################################
# library
add_library(${lib_name} STATIC ${${lib_name}_libsrcs})
set_wxtarget_properties(${lib_name})