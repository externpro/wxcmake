set(lib_name wxscintilla)
#######################################
# library sources
set(thisfile ${wxroot}/build/cmake/${lib_name}.cmake)
source_group("" FILES ${thisfile})
list(APPEND ${lib_name}_libsrcs ${thisfile})
########################
# Header Files
set(Header_srcs
  ${wxroot}/include/wx/msw/genrcdefs.h
  ${wxroot}/include/wx/msw/setup.h
  ${wxroot}/include/wx/univ/setup.h
  )
source_group("Header Files" FILES ${Header_srcs})
list(APPEND ${lib_name}_libsrcs ${Header_srcs})
########################
# Source Files
set(Source_srcs
  ${wxroot}/src/stc/scintilla/lexlib/Accessor.cxx
  ${wxroot}/src/stc/scintilla/src/AutoComplete.cxx
  ${wxroot}/src/stc/scintilla/src/CallTip.cxx
  ${wxroot}/src/stc/scintilla/src/Catalogue.cxx
  ${wxroot}/src/stc/scintilla/src/CellBuffer.cxx
  ${wxroot}/src/stc/scintilla/src/CharClassify.cxx
  ${wxroot}/src/stc/scintilla/lexlib/CharacterSet.cxx
  ${wxroot}/src/stc/scintilla/src/ContractionState.cxx
  ${wxroot}/src/stc/scintilla/src/Decoration.cxx
  ${wxroot}/src/stc/scintilla/src/Document.cxx
  ${wxroot}/src/stc/scintilla/src/Editor.cxx
  ${wxroot}/src/stc/scintilla/src/ExternalLexer.cxx
  ${wxroot}/src/stc/scintilla/src/Indicator.cxx
  ${wxroot}/src/stc/scintilla/src/KeyMap.cxx
  ${wxroot}/src/stc/scintilla/lexers/LexA68k.cxx
  ${wxroot}/src/stc/scintilla/lexers/LexAPDL.cxx
  ${wxroot}/src/stc/scintilla/lexers/LexASY.cxx
  ${wxroot}/src/stc/scintilla/lexers/LexAU3.cxx
  ${wxroot}/src/stc/scintilla/lexers/LexAVE.cxx
  ${wxroot}/src/stc/scintilla/lexers/LexAVS.cxx
  ${wxroot}/src/stc/scintilla/lexers/LexAbaqus.cxx
  ${wxroot}/src/stc/scintilla/lexers/LexAda.cxx
  ${wxroot}/src/stc/scintilla/lexers/LexAsm.cxx
  ${wxroot}/src/stc/scintilla/lexers/LexAsn1.cxx
  ${wxroot}/src/stc/scintilla/lexers/LexBaan.cxx
  ${wxroot}/src/stc/scintilla/lexers/LexBash.cxx
  ${wxroot}/src/stc/scintilla/lexers/LexBasic.cxx
  ${wxroot}/src/stc/scintilla/lexers/LexBullant.cxx
  ${wxroot}/src/stc/scintilla/lexers/LexCLW.cxx
  ${wxroot}/src/stc/scintilla/lexers/LexCOBOL.cxx
  ${wxroot}/src/stc/scintilla/lexers/LexCPP.cxx
  ${wxroot}/src/stc/scintilla/lexers/LexCSS.cxx
  ${wxroot}/src/stc/scintilla/lexers/LexCaml.cxx
  ${wxroot}/src/stc/scintilla/lexers/LexCmake.cxx
  ${wxroot}/src/stc/scintilla/lexers/LexCoffeeScript.cxx
  ${wxroot}/src/stc/scintilla/lexers/LexConf.cxx
  ${wxroot}/src/stc/scintilla/lexers/LexCrontab.cxx
  ${wxroot}/src/stc/scintilla/lexers/LexCsound.cxx
  ${wxroot}/src/stc/scintilla/lexers/LexD.cxx
  ${wxroot}/src/stc/scintilla/lexers/LexECL.cxx
  ${wxroot}/src/stc/scintilla/lexers/LexEScript.cxx
  ${wxroot}/src/stc/scintilla/lexers/LexEiffel.cxx
  ${wxroot}/src/stc/scintilla/lexers/LexErlang.cxx
  ${wxroot}/src/stc/scintilla/lexers/LexFlagship.cxx
  ${wxroot}/src/stc/scintilla/lexers/LexForth.cxx
  ${wxroot}/src/stc/scintilla/lexers/LexFortran.cxx
  ${wxroot}/src/stc/scintilla/lexers/LexGAP.cxx
  ${wxroot}/src/stc/scintilla/lexers/LexGui4Cli.cxx
  ${wxroot}/src/stc/scintilla/lexers/LexHTML.cxx
  ${wxroot}/src/stc/scintilla/lexers/LexHaskell.cxx
  ${wxroot}/src/stc/scintilla/lexers/LexInno.cxx
  ${wxroot}/src/stc/scintilla/lexers/LexKix.cxx
  ${wxroot}/src/stc/scintilla/lexers/LexLisp.cxx
  ${wxroot}/src/stc/scintilla/lexers/LexLout.cxx
  ${wxroot}/src/stc/scintilla/lexers/LexLua.cxx
  ${wxroot}/src/stc/scintilla/lexers/LexMMIXAL.cxx
  ${wxroot}/src/stc/scintilla/lexers/LexMPT.cxx
  ${wxroot}/src/stc/scintilla/lexers/LexMSSQL.cxx
  ${wxroot}/src/stc/scintilla/lexers/LexMagik.cxx
  ${wxroot}/src/stc/scintilla/lexers/LexMarkdown.cxx
  ${wxroot}/src/stc/scintilla/lexers/LexMatlab.cxx
  ${wxroot}/src/stc/scintilla/lexers/LexMetapost.cxx
  ${wxroot}/src/stc/scintilla/lexers/LexModula.cxx
  ${wxroot}/src/stc/scintilla/lexers/LexMySQL.cxx
  ${wxroot}/src/stc/scintilla/lexers/LexNimrod.cxx
  ${wxroot}/src/stc/scintilla/lexers/LexNsis.cxx
  ${wxroot}/src/stc/scintilla/lexers/LexOScript.cxx
  ${wxroot}/src/stc/scintilla/lexers/LexOpal.cxx
  ${wxroot}/src/stc/scintilla/lexers/LexOthers.cxx
  ${wxroot}/src/stc/scintilla/lexers/LexPB.cxx
  ${wxroot}/src/stc/scintilla/lexers/LexPLM.cxx
  ${wxroot}/src/stc/scintilla/lexers/LexPOV.cxx
  ${wxroot}/src/stc/scintilla/lexers/LexPS.cxx
  ${wxroot}/src/stc/scintilla/lexers/LexPascal.cxx
  ${wxroot}/src/stc/scintilla/lexers/LexPerl.cxx
  ${wxroot}/src/stc/scintilla/lexers/LexPowerPro.cxx
  ${wxroot}/src/stc/scintilla/lexers/LexPowerShell.cxx
  ${wxroot}/src/stc/scintilla/lexers/LexProgress.cxx
  ${wxroot}/src/stc/scintilla/lexers/LexPython.cxx
  ${wxroot}/src/stc/scintilla/lexers/LexR.cxx
  ${wxroot}/src/stc/scintilla/lexers/LexRebol.cxx
  ${wxroot}/src/stc/scintilla/lexers/LexRuby.cxx
  ${wxroot}/src/stc/scintilla/lexers/LexSML.cxx
  ${wxroot}/src/stc/scintilla/lexers/LexSQL.cxx
  ${wxroot}/src/stc/scintilla/lexers/LexScriptol.cxx
  ${wxroot}/src/stc/scintilla/lexers/LexSmalltalk.cxx
  ${wxroot}/src/stc/scintilla/lexers/LexSorcus.cxx
  ${wxroot}/src/stc/scintilla/lexers/LexSpecman.cxx
  ${wxroot}/src/stc/scintilla/lexers/LexSpice.cxx
  ${wxroot}/src/stc/scintilla/lexers/LexTACL.cxx
  ${wxroot}/src/stc/scintilla/lexers/LexTADS3.cxx
  ${wxroot}/src/stc/scintilla/lexers/LexTAL.cxx
  ${wxroot}/src/stc/scintilla/lexers/LexTCL.cxx
  ${wxroot}/src/stc/scintilla/lexers/LexTCMD.cxx
  ${wxroot}/src/stc/scintilla/lexers/LexTeX.cxx
  ${wxroot}/src/stc/scintilla/lexers/LexTxt2tags.cxx
  ${wxroot}/src/stc/scintilla/lexers/LexVB.cxx
  ${wxroot}/src/stc/scintilla/lexers/LexVHDL.cxx
  ${wxroot}/src/stc/scintilla/lexers/LexVerilog.cxx
  ${wxroot}/src/stc/scintilla/lexers/LexVisualProlog.cxx
  ${wxroot}/src/stc/scintilla/lexers/LexYAML.cxx
  ${wxroot}/src/stc/scintilla/lexlib/LexerBase.cxx
  ${wxroot}/src/stc/scintilla/lexlib/LexerModule.cxx
  ${wxroot}/src/stc/scintilla/lexlib/LexerNoExceptions.cxx
  ${wxroot}/src/stc/scintilla/lexlib/LexerSimple.cxx
  ${wxroot}/src/stc/scintilla/src/LineMarker.cxx
  ${wxroot}/src/stc/scintilla/src/PerLine.cxx
  ${wxroot}/src/stc/scintilla/src/PositionCache.cxx
  ${wxroot}/src/stc/scintilla/lexlib/PropSetSimple.cxx
  ${wxroot}/src/stc/scintilla/src/RESearch.cxx
  ${wxroot}/src/stc/scintilla/src/RunStyles.cxx
  ${wxroot}/src/stc/scintilla/src/ScintillaBase.cxx
  ${wxroot}/src/stc/scintilla/src/Selection.cxx
  ${wxroot}/src/stc/scintilla/src/Style.cxx
  ${wxroot}/src/stc/scintilla/lexlib/StyleContext.cxx
  ${wxroot}/src/stc/scintilla/src/UniConversion.cxx
  ${wxroot}/src/stc/scintilla/src/ViewStyle.cxx
  ${wxroot}/src/stc/scintilla/lexlib/WordList.cxx
  ${wxroot}/src/stc/scintilla/src/XPM.cxx
  )
source_group("Source Files" FILES ${Source_srcs})
list(APPEND ${lib_name}_libsrcs ${Source_srcs})
#######################################
# library
add_library(${lib_name} STATIC ${${lib_name}_libsrcs})
get_directory_property(global_includes INCLUDE_DIRECTORIES)
set_property(TARGET ${lib_name} PROPERTY
  INCLUDE_DIRECTORIES ${global_includes}
    ${wxroot}/src/stc/scintilla/include
    ${wxroot}/src/stc/scintilla/lexlib
    ${wxroot}/src/stc/scintilla/src
  )
set_property(TARGET ${lib_name} PROPERTY
  COMPILE_DEFINITIONS SCI_LEXER LINK_LEXERS __WXMSW__
  )
set_wxtarget_properties(${lib_name})
