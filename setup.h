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
#include <wx/version.h>
#if wxCHECK_VERSION(2,9,0)
# ifdef WIN64
#  include "../../../../lib64/mswu/wx/setup.h"
# else // WIN32
#  include "../../../../lib32/mswu/wx/setup.h"
# endif
#else
#  ifdef _UNICODE
#   error "Unicode support missing in externpro/include/wx/msvc/wx/setup.h"
#  endif
#  ifdef WIN64
#   include "../../../../lib64/msw/wx/setup.h"
#  else // WIN32
#   include "../../../../lib32/msw/wx/setup.h"
#  endif
# endif // wxCHECK_VERSION
#else
# error "This file should only be included when using Microsoft Visual C++"
#endif // _MSC_VER

#ifndef WXLIBS_DEFINED
#define WXLIBS_DEFINED

// wxWidgets includes <windows.h> in their wx/msw/wrapwin.h header - and they
// do a good job of defining some things (like NOMINMAX) in wrapwin.h, but
// there is one thing we've found that we need to define that they don't --
// windows.h includes winsock.h (WinSock 1.1). This conflicts with includes of
// winsock2.h. Define _WINSOCKAPI_ here so the preprocessor thinks winsock.h
// is already included.
#ifndef _WINSOCKAPI_
#define _WINSOCKAPI_
#endif

//TODO: once everyone moves >= wx2.9, we could include version.h here again,
// instead of at the top of the file
//#include <wx/version.h>

#if wxVERSION_NUMBER >= 3000
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

#if wxCHECK_VERSION(2,9,0)
# define wxUnicode "u"
#else
# ifdef _UNICODE
#  define wxUnicode "u"
# else
#  define wxUnicode ""
# endif
#endif

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
#else
# error "include/wx/msvc/wx/setup.h: unsupported MSVC compiler version"
#endif

// Tell the linker which wx libraries to include
#if wxCHECK_VERSION(2,9,0)
# pragma comment(lib, "wxbase" wxVersion wxCompiler wxUnicode wxRuntime)
# pragma comment(lib, "wxbase" wxVersion wxCompiler wxUnicode wxRuntime "_net")
# pragma comment(lib, "wxbase" wxVersion wxCompiler wxUnicode wxRuntime "_xml")
# pragma comment(lib, "wxexpat" "_" wxCompiler wxRuntime)
# pragma comment(lib, "wxjpeg" "_" wxCompiler wxRuntime)
# pragma comment(lib, "wxpng" "_" wxCompiler wxRuntime)
# pragma comment(lib, "wxregex" "_" wxCompiler wxUnicode wxRuntime)
# pragma comment(lib, "wxscintilla" "_" wxCompiler wxRuntime)
# pragma comment(lib, "wxtiff" "_" wxCompiler wxRuntime)
# pragma comment(lib, "wxzlib" "_" wxCompiler wxRuntime)
# pragma comment(lib, "wxmsw" wxVersion wxCompiler wxUnicode wxRuntime "_adv")
# pragma comment(lib, "wxmsw" wxVersion wxCompiler wxUnicode wxRuntime "_aui")
# pragma comment(lib, "wxmsw" wxVersion wxCompiler wxUnicode wxRuntime "_core")
# pragma comment(lib, "wxmsw" wxVersion wxCompiler wxUnicode wxRuntime "_gl")
# pragma comment(lib, "wxmsw" wxVersion wxCompiler wxUnicode wxRuntime "_html")
# pragma comment(lib, "wxmsw" wxVersion wxCompiler wxUnicode wxRuntime "_media")
# pragma comment(lib, "wxmsw" wxVersion wxCompiler wxUnicode wxRuntime "_propgrid")
# pragma comment(lib, "wxmsw" wxVersion wxCompiler wxUnicode wxRuntime "_qa")
# pragma comment(lib, "wxmsw" wxVersion wxCompiler wxUnicode wxRuntime "_richtext")
# pragma comment(lib, "wxmsw" wxVersion wxCompiler wxUnicode wxRuntime "_stc")
# pragma comment(lib, "wxmsw" wxVersion wxCompiler wxUnicode wxRuntime "_xrc")
#else
# pragma comment(lib, "wxbase" wxVersion wxCompiler wxUnicode wxRuntime)
# pragma comment(lib, "wxbase" wxVersion wxCompiler wxUnicode wxRuntime "_net")
# pragma comment(lib, "wxbase" wxVersion wxCompiler wxUnicode wxRuntime "_odbc")
# pragma comment(lib, "wxbase" wxVersion wxCompiler wxUnicode wxRuntime "_xml")
# pragma comment(lib, "wxexpat" "_" wxCompiler wxUnicode wxRuntime)
# pragma comment(lib, "wxjpeg" "_" wxCompiler wxUnicode wxRuntime)
# pragma comment(lib, "wxpng" "_" wxCompiler wxUnicode wxRuntime)
# pragma comment(lib, "wxregex" "_" wxCompiler wxUnicode wxRuntime)
# pragma comment(lib, "wxtiff" "_" wxCompiler wxUnicode wxRuntime)
# pragma comment(lib, "wxzlib" "_" wxCompiler wxUnicode wxRuntime)
# pragma comment(lib, "wxmsw" wxVersion wxCompiler wxUnicode wxRuntime "_adv")
# pragma comment(lib, "wxmsw" wxVersion wxCompiler wxUnicode wxRuntime "_aui")
# pragma comment(lib, "wxmsw" wxVersion wxCompiler wxUnicode wxRuntime "_core")
# pragma comment(lib, "wxmsw" wxVersion wxCompiler wxUnicode wxRuntime "_dbgrid")
# pragma comment(lib, "wxmsw" wxVersion wxCompiler wxUnicode wxRuntime "_gl")
# pragma comment(lib, "wxmsw" wxVersion wxCompiler wxUnicode wxRuntime "_html")
# pragma comment(lib, "wxmsw" wxVersion wxCompiler wxUnicode wxRuntime "_media")
# pragma comment(lib, "wxmsw" wxVersion wxCompiler wxUnicode wxRuntime "_qa")
# pragma comment(lib, "wxmsw" wxVersion wxCompiler wxUnicode wxRuntime "_richtext")
# pragma comment(lib, "wxmsw" wxVersion wxCompiler wxUnicode wxRuntime "_xrc")
#endif // wxCHECK_VERSION
// 3rd-party wxWidgets libraries in externpro (wxx = wx-extra)
//  not part of the main wxWidgets distribution...
#pragma comment(lib, "wxxmsw" wxVersion wxCompiler wxRuntime "_ifm") // wxIFM
#pragma comment(lib, "wxxmsw" wxVersion wxCompiler wxRuntime "_tlc") // wxTreeListCtrl
#pragma comment(lib, "wxxmsw" wxVersion wxCompiler wxRuntime "_tmc") // wxTreeMultiCtrl
#pragma comment(lib, "wxxmsw" wxVersion wxCompiler wxRuntime "_things") // wxthings
#pragma comment(lib, "wxxmsw" wxVersion wxCompiler wxRuntime "_plotctrl") // wxplotctrl

// wxCore requires the following system libraries
#pragma comment(lib, "rpcrt4")
#pragma comment(lib, "comctl32")
#pragma comment(lib, "gdiplus") // wxUSE_GRAPHICS_CONTEXT set to 1 in setup.h

#endif // WXLIBS_DEFINED
