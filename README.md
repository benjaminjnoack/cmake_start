CMake generator for Atmel START

**usage**

* Configure a project using [Atmel START](https://start.atmel.com/)
* Export Project -> Download Pack
* Run the `generate.sh` script with the following arguments:
	1. `INPUT_FILE`
		* _absolute_ path to Atmel START `*.atzip` file
	2. `OUTPUT_DIR`
		* absolute path to output directory
		* NOTE: this directory will be emptied prior to source extraction and CMake generation!
	3. `OUTPUT_LIB`
		* name for library to build


For example:

```
$ ./generate.sh ~/projects/boot2/boot.atzip /home/ben/test START
```

The source from `*.atzip` will be extracted into the provided output directory.
The automatically generate `CMakeLists.txt` will be placed in the output directory.

The generated `CMakeLists.txt` will build the Atmel START source code as an object library.
The generated `CMakeLists.txt` should be [included](https://cmake.org/cmake/help/v3.11/command/include.html) into your project.
For example:

```
include(${CMAKE_CURRENT_LIST_DIR}/external/cmake_start/CMakeLists.txt)
target_link_libraries(${PROJECT_NAME} PRIVATE
        $OUTPUT_LIB
        )
```
