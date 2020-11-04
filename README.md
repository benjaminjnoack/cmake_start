CMake generator for Atmel START

**usage**

Configure a project using [Atmel START](https://start.atmel.com/)

* Export Project -> Download Pack
* Copy the downloaded `*.atzip` file to the root directory of this project as `start.atzip`.
* run the `generate.sh` script

The source from `start.atzip` will be extracted into an ignored `src` folder.
The automatically generate `CMakeLists.txt` will be placed in the root directory of this project.

The source code from Atmel START will be built as an object library.
The generated `CMakeLists.txt` should be [included](https://cmake.org/cmake/help/v3.11/command/include.html) into your project.
For example:

```
include(${CMAKE_CURRENT_LIST_DIR}/external/cmake_start/CMakeLists.txt)
```
