wxcmake
=======

build wxWidgets via cmake
https://github.com/externpro/wxcmake/compare/wx0...xpro

https://docs.wxwidgets.org/3.1.0/page_libs.html
![graph](graph.png 'dependency graph')

* graph generated with command
  ```
  dot -Tpng graph.dot -o graph.png
  ```
* `lightblue` libraries depend on `base`: non-gui libraries
* `palegreen` libraries depend on `core`: gui libraries
* `burlywood` are wx-external libraries
* `mistyrose` are linux system libraries
* `cornsilk` are darwin system libraries
* `peachpuff` are linux/darwin system libraries
* `thistle` are msw system libraries
* solid lines are public dependencies
* dashed lines are private/link dependencies
* linux/darwin dependencies are specified in [wxwidgets-targets.cmake](wxwidgets-targets.cmake)
* msw dependencies are specified by `target_link_libraries()` calls in each library's `.cmake` file, for example [core.cmake](core.cmake) and [base.cmake](base.cmake)
