set(lib_name xrc)
#######################################
# library sources
set(thisfile ${wxroot}/build/cmake/${lib_name}.cmake)
source_group("" FILES ${thisfile})
list(APPEND ${lib_name}_libsrcs ${thisfile})
########################
# Common Headers
set(Common_hdrs
  ${wxroot}/include/wx/xrc/xh_all.h
  ${wxroot}/include/wx/xrc/xh_animatctrl.h
  ${wxroot}/include/wx/xrc/xh_bannerwindow.h
  ${wxroot}/include/wx/xrc/xh_bmp.h
  ${wxroot}/include/wx/xrc/xh_bmpbt.h
  ${wxroot}/include/wx/xrc/xh_bmpcbox.h
  ${wxroot}/include/wx/xrc/xh_bttn.h
  ${wxroot}/include/wx/xrc/xh_cald.h
  ${wxroot}/include/wx/xrc/xh_chckb.h
  ${wxroot}/include/wx/xrc/xh_chckl.h
  ${wxroot}/include/wx/xrc/xh_choic.h
  ${wxroot}/include/wx/xrc/xh_choicbk.h
  ${wxroot}/include/wx/xrc/xh_clrpicker.h
  ${wxroot}/include/wx/xrc/xh_cmdlinkbn.h
  ${wxroot}/include/wx/xrc/xh_collpane.h
  ${wxroot}/include/wx/xrc/xh_combo.h
  ${wxroot}/include/wx/xrc/xh_comboctrl.h
  ${wxroot}/include/wx/xrc/xh_datectrl.h
  ${wxroot}/include/wx/xrc/xh_dirpicker.h
  ${wxroot}/include/wx/xrc/xh_dlg.h
  ${wxroot}/include/wx/xrc/xh_editlbox.h
  ${wxroot}/include/wx/xrc/xh_filectrl.h
  ${wxroot}/include/wx/xrc/xh_filepicker.h
  ${wxroot}/include/wx/xrc/xh_fontpicker.h
  ${wxroot}/include/wx/xrc/xh_frame.h
  ${wxroot}/include/wx/xrc/xh_gauge.h
  ${wxroot}/include/wx/xrc/xh_gdctl.h
  ${wxroot}/include/wx/xrc/xh_grid.h
  ${wxroot}/include/wx/xrc/xh_html.h
  ${wxroot}/include/wx/xrc/xh_htmllbox.h
  ${wxroot}/include/wx/xrc/xh_hyperlink.h
  ${wxroot}/include/wx/xrc/xh_listb.h
  ${wxroot}/include/wx/xrc/xh_listbk.h
  ${wxroot}/include/wx/xrc/xh_listc.h
  ${wxroot}/include/wx/xrc/xh_mdi.h
  ${wxroot}/include/wx/xrc/xh_menu.h
  ${wxroot}/include/wx/xrc/xh_notbk.h
  ${wxroot}/include/wx/xrc/xh_odcombo.h
  ${wxroot}/include/wx/xrc/xh_panel.h
  ${wxroot}/include/wx/xrc/xh_propdlg.h
  ${wxroot}/include/wx/xrc/xh_radbt.h
  ${wxroot}/include/wx/xrc/xh_radbx.h
  ${wxroot}/include/wx/xrc/xh_scrol.h
  ${wxroot}/include/wx/xrc/xh_scwin.h
  ${wxroot}/include/wx/xrc/xh_sizer.h
  ${wxroot}/include/wx/xrc/xh_slidr.h
  ${wxroot}/include/wx/xrc/xh_spin.h
  ${wxroot}/include/wx/xrc/xh_split.h
  ${wxroot}/include/wx/xrc/xh_srchctrl.h
  ${wxroot}/include/wx/xrc/xh_statbar.h
  ${wxroot}/include/wx/xrc/xh_stbmp.h
  ${wxroot}/include/wx/xrc/xh_stbox.h
  ${wxroot}/include/wx/xrc/xh_stlin.h
  ${wxroot}/include/wx/xrc/xh_sttxt.h
  ${wxroot}/include/wx/xrc/xh_text.h
  ${wxroot}/include/wx/xrc/xh_tglbtn.h
  ${wxroot}/include/wx/xrc/xh_timectrl.h
  ${wxroot}/include/wx/xrc/xh_toolb.h
  ${wxroot}/include/wx/xrc/xh_toolbk.h
  ${wxroot}/include/wx/xrc/xh_tree.h
  ${wxroot}/include/wx/xrc/xh_treebk.h
  ${wxroot}/include/wx/xrc/xh_unkwn.h
  ${wxroot}/include/wx/xrc/xh_wizrd.h
  ${wxroot}/include/wx/xrc/xmlres.h
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
# MSW Headers
set(MSW_hdrs
  ${wxroot}/include/wx/msw/genrcdefs.h
  )
source_group("MSW Headers" FILES ${MSW_hdrs})
list(APPEND ${lib_name}_libsrcs ${MSW_hdrs})
########################
# MSW Sources
set(MSW_srcs
  #${wxroot}/src/msw/version.rc
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
# Source Files
set(Source_srcs
  ${wxroot}/src/xrc/xh_animatctrl.cpp
  ${wxroot}/src/xrc/xh_bannerwindow.cpp
  ${wxroot}/src/xrc/xh_bmp.cpp
  ${wxroot}/src/xrc/xh_bmpbt.cpp
  ${wxroot}/src/xrc/xh_bmpcbox.cpp
  ${wxroot}/src/xrc/xh_bttn.cpp
  ${wxroot}/src/xrc/xh_cald.cpp
  ${wxroot}/src/xrc/xh_chckb.cpp
  ${wxroot}/src/xrc/xh_chckl.cpp
  ${wxroot}/src/xrc/xh_choic.cpp
  ${wxroot}/src/xrc/xh_choicbk.cpp
  ${wxroot}/src/xrc/xh_clrpicker.cpp
  ${wxroot}/src/xrc/xh_cmdlinkbn.cpp
  ${wxroot}/src/xrc/xh_collpane.cpp
  ${wxroot}/src/xrc/xh_combo.cpp
  ${wxroot}/src/xrc/xh_comboctrl.cpp
  ${wxroot}/src/xrc/xh_datectrl.cpp
  ${wxroot}/src/xrc/xh_dirpicker.cpp
  ${wxroot}/src/xrc/xh_dlg.cpp
  ${wxroot}/src/xrc/xh_editlbox.cpp
  ${wxroot}/src/xrc/xh_filectrl.cpp
  ${wxroot}/src/xrc/xh_filepicker.cpp
  ${wxroot}/src/xrc/xh_fontpicker.cpp
  ${wxroot}/src/xrc/xh_frame.cpp
  ${wxroot}/src/xrc/xh_gauge.cpp
  ${wxroot}/src/xrc/xh_gdctl.cpp
  ${wxroot}/src/xrc/xh_grid.cpp
  ${wxroot}/src/xrc/xh_html.cpp
  ${wxroot}/src/xrc/xh_htmllbox.cpp
  ${wxroot}/src/xrc/xh_hyperlink.cpp
  ${wxroot}/src/xrc/xh_listb.cpp
  ${wxroot}/src/xrc/xh_listbk.cpp
  ${wxroot}/src/xrc/xh_listc.cpp
  ${wxroot}/src/xrc/xh_mdi.cpp
  ${wxroot}/src/xrc/xh_menu.cpp
  ${wxroot}/src/xrc/xh_notbk.cpp
  ${wxroot}/src/xrc/xh_odcombo.cpp
  ${wxroot}/src/xrc/xh_panel.cpp
  ${wxroot}/src/xrc/xh_propdlg.cpp
  ${wxroot}/src/xrc/xh_radbt.cpp
  ${wxroot}/src/xrc/xh_radbx.cpp
  ${wxroot}/src/xrc/xh_scrol.cpp
  ${wxroot}/src/xrc/xh_scwin.cpp
  ${wxroot}/src/xrc/xh_sizer.cpp
  ${wxroot}/src/xrc/xh_slidr.cpp
  ${wxroot}/src/xrc/xh_spin.cpp
  ${wxroot}/src/xrc/xh_split.cpp
  ${wxroot}/src/xrc/xh_srchctrl.cpp
  ${wxroot}/src/xrc/xh_statbar.cpp
  ${wxroot}/src/xrc/xh_stbmp.cpp
  ${wxroot}/src/xrc/xh_stbox.cpp
  ${wxroot}/src/xrc/xh_stlin.cpp
  ${wxroot}/src/xrc/xh_sttxt.cpp
  ${wxroot}/src/xrc/xh_text.cpp
  ${wxroot}/src/xrc/xh_tglbtn.cpp
  ${wxroot}/src/xrc/xh_timectrl.cpp
  ${wxroot}/src/xrc/xh_toolb.cpp
  ${wxroot}/src/xrc/xh_toolbk.cpp
  ${wxroot}/src/xrc/xh_tree.cpp
  ${wxroot}/src/xrc/xh_treebk.cpp
  ${wxroot}/src/xrc/xh_unkwn.cpp
  ${wxroot}/src/xrc/xh_wizrd.cpp
  ${wxroot}/src/xrc/xmladv.cpp
  ${wxroot}/src/xrc/xmlres.cpp
  ${wxroot}/src/xrc/xmlrsall.cpp
  )
source_group("Source Files" FILES ${Source_srcs})
list(APPEND ${lib_name}_libsrcs ${Source_srcs})
#######################################
# library
add_library(${lib_name} STATIC ${${lib_name}_libsrcs})
set_wxtarget_properties(${lib_name})
