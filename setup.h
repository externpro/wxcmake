/*  Filename: setup.h
 *  Description: This header is included by wxWidgets source code (SDL code
 *    shouldn't need to explicitly include this header). It includes the
 *    appropriate setup.h and detects the wxWidgets version being used and
 *    chooses the appropriate libraries automatically. This header makes it so
 *    we won't need to modify the wxWidgets library names in the vcproj files
 *    when we switch wxWidgets versions.
 *  Author: Scott M Anderson (aka smanders)
 */

#ifdef _MSC_VER
# include <wx/version.h>
# if wxCHECK_VERSION(3,0,0)
#  include "../../../../../lib/msw/wx-3.0/wx/setup.h"
# else
#  error "This custom setup.h is specific to wx 3.0"
# endif // wxCHECK_VERSION
#else
# error "This file should only be included when using Microsoft Visual C++"
#endif // _MSC_VER

#ifndef WXLIBS_DEFINED
#define WXLIBS_DEFINED

#if wxVERSION_NUMBER >= 3100
# define wxVersion "31"
#elif wxVERSION_NUMBER >= 3000
# define wxVersion "30"
#elif wxVERSION_NUMBER >= 2900
# define wxVersion "29"
#elif wxVERSION_NUMBER >= 2800
# define wxVersion "28"
#elif wxVERSION_NUMBER >= 2700
# define wxVersion "27"
# error "Please update to at least wxWidgets 2.8!"
#elif wxVERSION_NUMBER >= 2600
# define wxVersion "26"
# error "Please update to at least wxWidgets 2.8!"
#elif wxVERSION >= 2500
# define wxVersion "25"
# error "Please update to at least wxWidgets 2.8!"
#else
# error "Please update to at least wxWidgets 2.8!"
// versions of wxWidgets previous to 2.5 used a different naming scheme
#endif

// wx 2.9 and later is always unicode
#define wxUnicode "u"

#if defined _DEBUG
# define wxRuntime "d"
#elif defined _DLL
# define wxRuntime ""
#else
# define wxRuntime "s"
#endif

#if _MSC_VER == 1200
# define wxCompiler "vc60"
#elif _MSC_VER == 1300
# define wxCompiler "vc70"
#elif _MSC_VER == 1310
# define wxCompiler "vc71"
#elif _MSC_VER == 1400 // VC 8.0 (aka VS2005)
# define wxCompiler "vc80"
#elif _MSC_VER == 1500
# define wxCompiler "vc90"
#elif _MSC_VER == 1600 // VC 10.0 (aka VS2010)
# define wxCompiler "vc100"
#elif _MSC_VER == 1700
# define wxCompiler "vc110" // VC 11.0 (aka VS2012)
#elif _MSC_VER == 1800
# define wxCompiler "vc120" // VC 12.0 (aka VS2013)
#else
# error "include/wx/msvc/wx/setup.h: unsupported MSVC compiler version"
#endif

// Tell the linker which wx libraries to include
#pragma comment(lib, "wxbase" wxVersion wxCompiler wxUnicode wxRuntime)
#pragma comment(lib, "wxbase" wxVersion wxCompiler wxUnicode wxRuntime "_net")
#pragma comment(lib, "wxbase" wxVersion wxCompiler wxUnicode wxRuntime "_xml")
#pragma comment(lib, "wxexpat" wxVersion "_" wxCompiler wxRuntime)
#pragma comment(lib, "wxjpeg" wxVersion "_" wxCompiler wxRuntime)
#pragma comment(lib, "wxpng" wxVersion "_" wxCompiler wxRuntime)
#pragma comment(lib, "wxregex" wxVersion "_" wxCompiler wxUnicode wxRuntime)
#pragma comment(lib, "wxscintilla" wxVersion "_" wxCompiler wxRuntime)
#pragma comment(lib, "wxtiff" wxVersion "_" wxCompiler wxRuntime)
#pragma comment(lib, "wxzlib" wxVersion "_" wxCompiler wxRuntime)
#pragma comment(lib, "wxmsw" wxVersion wxCompiler wxUnicode wxRuntime "_adv")
#pragma comment(lib, "wxmsw" wxVersion wxCompiler wxUnicode wxRuntime "_aui")
#pragma comment(lib, "wxmsw" wxVersion wxCompiler wxUnicode wxRuntime "_core")
#pragma comment(lib, "wxmsw" wxVersion wxCompiler wxUnicode wxRuntime "_gl")
#pragma comment(lib, "wxmsw" wxVersion wxCompiler wxUnicode wxRuntime "_html")
#pragma comment(lib, "wxmsw" wxVersion wxCompiler wxUnicode wxRuntime "_media")
#pragma comment(lib, "wxmsw" wxVersion wxCompiler wxUnicode wxRuntime "_propgrid")
#pragma comment(lib, "wxmsw" wxVersion wxCompiler wxUnicode wxRuntime "_qa")
#pragma comment(lib, "wxmsw" wxVersion wxCompiler wxUnicode wxRuntime "_ribbon")
#pragma comment(lib, "wxmsw" wxVersion wxCompiler wxUnicode wxRuntime "_richtext")
#pragma comment(lib, "wxmsw" wxVersion wxCompiler wxUnicode wxRuntime "_stc")
#pragma comment(lib, "wxmsw" wxVersion wxCompiler wxUnicode wxRuntime "_webview")
#pragma comment(lib, "wxmsw" wxVersion wxCompiler wxUnicode wxRuntime "_xrc")

// 3rd-party wxWidgets libraries in externpro (wxx = wx-extra)
//  not part of the main wxWidgets distribution...
#pragma comment(lib, "wxxmsw" wxVersion wxCompiler wxRuntime "_tlc") // wxTreeListCtrl
#pragma comment(lib, "wxxmsw" wxVersion wxCompiler wxRuntime "_things") // wxthings
#pragma comment(lib, "wxxmsw" wxVersion wxCompiler wxRuntime "_plotctrl") // wxplotctrl

// wxCore requires the following system libraries
#pragma comment(lib, "rpcrt4")
#pragma comment(lib, "comctl32")
#pragma comment(lib, "gdiplus") // wxUSE_GRAPHICS_CONTEXT set to 1 in setup.h

#endif // WXLIBS_DEFINED
