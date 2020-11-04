CMake generator for Atmel START

**usage**

* Configure a project using [Atmel START](https://start.atmel.com/)
* Export Project -> Download Pack
* Run the `generate.sh` script with the following arguments:
	1. path to START `*.atzip` file
	2. _absolute_ path to output directory
		* _NOTE: this directory will be emptied prior to source extraction and CMake generation!_


For example:

```
$ ./generate.sh ~/projects/boot2/boot.atzip /home/ben/test
```

The source from `*.atzip` will be extracted into the provided output directory.
The automatically generate `CMakeLists.txt` will be placed in the output directory.

The generated `CMakeLists.txt` will build the Atmel START source code as an object library.
The generated `CMakeLists.txt` should be [included](https://cmake.org/cmake/help/v3.11/command/include.html) into your project.
For example:

```
include(${CMAKE_CURRENT_LIST_DIR}/external/cmake_start/CMakeLists.txt)
target_link_libraries(${PROJECT_NAME} PRIVATE
        START
        )
```
