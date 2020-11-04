CMake generator for Atmel START

**usage**

Configure the project using [Atmel START](https://start.atmel.com/)

* Export Project -> Download Pack
* Copy the downloaded `*.atzip` file to the root directory of this project as `start.atzip`.
* run the `generate.sh` script

The source from `start.atzip` will be extracted into an ignored `src` folder.
The automatically generate `CMakeLists.txt` will be placed in the root directory of this project.

