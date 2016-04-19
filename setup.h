/*  Filename: setup.h
 *  Description: This header is included by wxWidgets source code (your code
 *    shouldn't need to explicitly include this header). It includes the
 *    appropriate setup.h in the lib directory.
 *  Author: Scott M Anderson (aka smanders)
 */

#ifdef _MSC_VER
# include <wx/version.h>
# if wxCHECK_VERSION(3,1,0)
#  include "../../../../../lib/msw/wx-3.1/wx/setup.h"
# else
#  error "This custom setup.h is specific to wx 3.1"
# endif // wxCHECK_VERSION
#else
# error "This file should only be included when using Microsoft Visual C++"
#endif // _MSC_VER
