set(lib_name adv)
#######################################
# library sources
source_group("" FILES ${lib_name}.cmake)
list(APPEND ${lib_name}_libsrcs ${lib_name}.cmake)
########################
# Common Headers
set(Common_hdrs
  ${wxroot}/include/wx/aboutdlg.h
  ${wxroot}/include/wx/animate.h
  ${wxroot}/include/wx/animdecod.h
  ${wxroot}/include/wx/bmpcbox.h
  ${wxroot}/include/wx/calctrl.h
  ${wxroot}/include/wx/dataview.h
  ${wxroot}/include/wx/datectrl.h
  ${wxroot}/include/wx/dateevt.h
  ${wxroot}/include/wx/dcbuffer.h
  ${wxroot}/include/wx/grid.h
  ${wxroot}/include/wx/hyperlink.h
  ${wxroot}/include/wx/joystick.h
  ${wxroot}/include/wx/laywin.h
  ${wxroot}/include/wx/odcombo.h
  ${wxroot}/include/wx/propdlg.h
  ${wxroot}/include/wx/sashwin.h
  ${wxroot}/include/wx/sound.h
  ${wxroot}/include/wx/splash.h
  ${wxroot}/include/wx/taskbar.h
  ${wxroot}/include/wx/tipdlg.h
  ${wxroot}/include/wx/wave.h
  ${wxroot}/include/wx/wizard.h
  )
source_group("Common Headers" FILES ${Common_hdrs})
list(APPEND ${lib_name}_libsrcs ${Common_hdrs})
########################
# Common Sources
set(Common_srcs
  ${wxroot}/src/common/animatecmn.cpp
  ${wxroot}/src/common/datavcmn.cpp
  ${wxroot}/src/common/dummy.cpp
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
  ${wxroot}/include/wx/generic/calctrl.h
  ${wxroot}/include/wx/generic/dataview.h
  ${wxroot}/include/wx/generic/datectrl.h
  ${wxroot}/include/wx/generic/grid.h
  ${wxroot}/include/wx/generic/gridctrl.h
  ${wxroot}/include/wx/generic/gridsel.h
  ${wxroot}/include/wx/generic/helpext.h
  ${wxroot}/include/wx/generic/laywin.h
  ${wxroot}/include/wx/generic/propdlg.h
  ${wxroot}/include/wx/generic/sashwin.h
  ${wxroot}/include/wx/generic/splash.h
  ${wxroot}/include/wx/generic/wizard.h
  )
source_group("Generic Headers" FILES ${Generic_hdrs})
list(APPEND ${lib_name}_libsrcs ${Generic_hdrs})
########################
# Generic Sources
set(Generic_srcs
  ${wxroot}/src/generic/aboutdlgg.cpp
  ${wxroot}/src/generic/animateg.cpp
  ${wxroot}/src/generic/bmpcboxg.cpp
  ${wxroot}/src/generic/calctrl.cpp
  ${wxroot}/src/generic/datavgen.cpp
  ${wxroot}/src/generic/datectlg.cpp
  ${wxroot}/src/generic/grid.cpp
  ${wxroot}/src/generic/gridctrl.cpp
  ${wxroot}/src/generic/gridsel.cpp
  ${wxroot}/src/generic/helpext.cpp
  ${wxroot}/src/generic/hyperlink.cpp
  ${wxroot}/src/generic/laywin.cpp
  ${wxroot}/src/generic/odcombo.cpp
  ${wxroot}/src/generic/propdlg.cpp
  ${wxroot}/src/generic/sashwin.cpp
  ${wxroot}/src/generic/splash.cpp
  ${wxroot}/src/generic/tipdlg.cpp
  ${wxroot}/src/generic/wizard.cpp
  )
source_group("Generic Sources" FILES ${Generic_srcs})
list(APPEND ${lib_name}_libsrcs ${Generic_srcs})
########################
# MSW Headers
set(MSW_hdrs
  ${wxroot}/include/wx/msw/datectrl.h
  ${wxroot}/include/wx/msw/genrcdefs.h
  ${wxroot}/include/wx/msw/joystick.h
  ${wxroot}/include/wx/msw/sound.h
  ${wxroot}/include/wx/msw/taskbar.h
  )
source_group("MSW Headers" FILES ${MSW_hdrs})
list(APPEND ${lib_name}_libsrcs ${MSW_hdrs})
########################
# MSW Sources
set(MSW_srcs
  ${wxroot}/src/msw/aboutdlg.cpp
  ${wxroot}/src/msw/datectrl.cpp
  ${wxroot}/src/msw/joystick.cpp
  ${wxroot}/src/msw/sound.cpp
  ${wxroot}/src/msw/taskbar.cpp
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