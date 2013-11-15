set(lib_name adv)
#######################################
# library sources
set(thisfile ${wxroot}/build/cmake/${lib_name}.cmake)
source_group("" FILES ${thisfile})
list(APPEND ${lib_name}_libsrcs ${thisfile})
########################
# Common Headers
set(Common_hdrs
  ${wxroot}/include/wx/aboutdlg.h
  ${wxroot}/include/wx/animate.h
  ${wxroot}/include/wx/bannerwindow.h
  ${wxroot}/include/wx/bmpcbox.h
  ${wxroot}/include/wx/calctrl.h
  ${wxroot}/include/wx/commandlinkbutton.h
  ${wxroot}/include/wx/dataview.h
  ${wxroot}/include/wx/datectrl.h
  ${wxroot}/include/wx/dateevt.h
  ${wxroot}/include/wx/datetimectrl.h
  ${wxroot}/include/wx/dcbuffer.h
  ${wxroot}/include/wx/dvrenderers.h
  ${wxroot}/include/wx/editlbox.h
  ${wxroot}/include/wx/grid.h
  ${wxroot}/include/wx/hyperlink.h
  ${wxroot}/include/wx/joystick.h
  ${wxroot}/include/wx/laywin.h
  ${wxroot}/include/wx/notifmsg.h
  ${wxroot}/include/wx/odcombo.h
  ${wxroot}/include/wx/propdlg.h
  ${wxroot}/include/wx/richtooltip.h
  ${wxroot}/include/wx/sashwin.h
  ${wxroot}/include/wx/sound.h
  ${wxroot}/include/wx/splash.h
  ${wxroot}/include/wx/taskbar.h
  ${wxroot}/include/wx/timectrl.h
  ${wxroot}/include/wx/tipdlg.h
  ${wxroot}/include/wx/treelist.h
  ${wxroot}/include/wx/wizard.h
  )
source_group("Common Headers" FILES ${Common_hdrs})
list(APPEND ${lib_name}_libsrcs ${Common_hdrs})
########################
# Common Sources
set(Common_srcs
  ${wxroot}/src/common/animatecmn.cpp
  ${wxroot}/src/common/bmpcboxcmn.cpp
  ${wxroot}/src/common/calctrlcmn.cpp
  ${wxroot}/src/common/datavcmn.cpp
  ${wxroot}/src/common/dummy.cpp
  ${wxroot}/src/common/gridcmn.cpp
  ${wxroot}/src/common/hyperlnkcmn.cpp
  ${wxroot}/src/common/odcombocmn.cpp
  ${wxroot}/src/common/richtooltipcmn.cpp
  ${wxroot}/src/common/taskbarcmn.cpp
  )
source_group("Common Sources" FILES ${Common_srcs})
list(APPEND ${lib_name}_libsrcs ${Common_srcs})
########################
# Generic Headers
set(Generic_hdrs
  ${wxroot}/include/wx/generic/aboutdlgg.h
  ${wxroot}/include/wx/generic/animate.h
  ${wxroot}/include/wx/generic/bmpcbox.h
  ${wxroot}/include/wx/generic/calctrlg.h
  ${wxroot}/include/wx/generic/dataview.h
  ${wxroot}/include/wx/generic/datectrl.h
  ${wxroot}/include/wx/generic/dvrenderer.h
  ${wxroot}/include/wx/generic/dvrenderers.h
  ${wxroot}/include/wx/generic/grid.h
  ${wxroot}/include/wx/generic/gridctrl.h
  ${wxroot}/include/wx/generic/grideditors.h
  ${wxroot}/include/wx/generic/gridsel.h
  ${wxroot}/include/wx/generic/helpext.h
  ${wxroot}/include/wx/generic/hyperlink.h
  ${wxroot}/include/wx/generic/laywin.h
  ${wxroot}/include/wx/generic/notifmsg.h
  ${wxroot}/include/wx/generic/propdlg.h
  ${wxroot}/include/wx/generic/sashwin.h
  ${wxroot}/include/wx/generic/splash.h
  ${wxroot}/include/wx/generic/timectrl.h
  ${wxroot}/include/wx/generic/wizard.h
  )
source_group("Generic Headers" FILES ${Generic_hdrs})
list(APPEND ${lib_name}_libsrcs ${Generic_hdrs})
########################
# Generic Sources
set(Generic_srcs
  ${wxroot}/src/generic/aboutdlgg.cpp
  ${wxroot}/src/generic/animateg.cpp
  ${wxroot}/src/generic/bannerwindow.cpp
  ${wxroot}/src/generic/bmpcboxg.cpp
  ${wxroot}/src/generic/calctrlg.cpp
  ${wxroot}/src/generic/commandlinkbuttong.cpp
  ${wxroot}/src/generic/datavgen.cpp
  ${wxroot}/src/generic/datectlg.cpp
  ${wxroot}/src/generic/editlbox.cpp
  ${wxroot}/src/generic/grid.cpp
  ${wxroot}/src/generic/gridctrl.cpp
  ${wxroot}/src/generic/grideditors.cpp
  ${wxroot}/src/generic/gridsel.cpp
  ${wxroot}/src/generic/helpext.cpp
  ${wxroot}/src/generic/hyperlinkg.cpp
  ${wxroot}/src/generic/laywin.cpp
  ${wxroot}/src/generic/notifmsgg.cpp
  ${wxroot}/src/generic/odcombo.cpp
  ${wxroot}/src/generic/propdlg.cpp
  ${wxroot}/src/generic/richtooltipg.cpp
  ${wxroot}/src/generic/sashwin.cpp
  ${wxroot}/src/generic/splash.cpp
  ${wxroot}/src/generic/timectrlg.cpp
  ${wxroot}/src/generic/tipdlg.cpp
  ${wxroot}/src/generic/treelist.cpp
  ${wxroot}/src/generic/wizard.cpp
  )
source_group("Generic Sources" FILES ${Generic_srcs})
list(APPEND ${lib_name}_libsrcs ${Generic_srcs})
########################
# MSW Headers
set(MSW_hdrs
  ${wxroot}/include/wx/msw/bmpcbox.h
  ${wxroot}/include/wx/msw/calctrl.h
  ${wxroot}/include/wx/msw/commandlinkbutton.h
  ${wxroot}/include/wx/msw/datectrl.h
  ${wxroot}/include/wx/msw/datetimectrl.h
  ${wxroot}/include/wx/msw/genrcdefs.h
  ${wxroot}/include/wx/msw/hyperlink.h
  ${wxroot}/include/wx/msw/joystick.h
  ${wxroot}/include/wx/msw/notifmsg.h
  ${wxroot}/include/wx/msw/sound.h
  ${wxroot}/include/wx/msw/taskbar.h
  ${wxroot}/include/wx/msw/timectrl.h
  )
source_group("MSW Headers" FILES ${MSW_hdrs})
list(APPEND ${lib_name}_libsrcs ${MSW_hdrs})
########################
# MSW Sources
set(MSW_srcs
  ${wxroot}/src/msw/aboutdlg.cpp
  ${wxroot}/src/msw/bmpcbox.cpp
  ${wxroot}/src/msw/calctrl.cpp
  ${wxroot}/src/msw/commandlinkbutton.cpp
  ${wxroot}/src/msw/datecontrols.cpp
  ${wxroot}/src/msw/datectrl.cpp
  ${wxroot}/src/msw/datetimectrl.cpp
  ${wxroot}/src/msw/hyperlink.cpp
  ${wxroot}/src/msw/joystick.cpp
  ${wxroot}/src/msw/notifmsg.cpp
  ${wxroot}/src/msw/richtooltip.cpp
  ${wxroot}/src/msw/sound.cpp
  ${wxroot}/src/msw/taskbar.cpp
  ${wxroot}/src/msw/timectrl.cpp
  #${wxroot}/src/msw/version.rc
  )
source_group("MSW Sources" FILES ${MSW_srcs})
list(APPEND ${lib_name}_libsrcs ${MSW_srcs})
########################
# Setup Headers
set(Setup_hdrs
  ${wxroot}/include/wx/msw/setup.h
  )
source_group("Setup Headers" FILES ${Setup_hdrs})
list(APPEND ${lib_name}_libsrcs ${Setup_hdrs})
#######################################
# library
add_library(${lib_name} STATIC ${${lib_name}_libsrcs})
set_wxtarget_properties(${lib_name})
