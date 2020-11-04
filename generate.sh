#!/bin/bash
# usage: ./generate.sh /path/to/input.atzip /path/to/output/dir

set -eu

INPUT_FILE=$1
OUTPUT_DIR=$2

if [ ! -d $OUTPUT_DIR ];
then
	echo "$OUTPUT_DIR is not a directory"
	exit 1
fi

# moving into the output dir will make building the CMakeLists filepaths much simpler
cd $OUTPUT_DIR
rm -rf ./*
unzip -d ./ $INPUT_FILE > /dev/null 2>&1

find ./ -type f -exec dos2unix {} \; 2> /dev/null

# these directories contain source code for other compilers and will throw errors when given to gcc
rm -fr ./samc21/armcc
# we don't need their main
rm -f ./main.c

CMAKE=CMakeLists.txt

echo "#WARNING: this CMakeLists.txt file is automatically generated by the \"generate.sh\" script!
cmake_minimum_required(VERSION 3.16)

add_library(START OBJECT)
target_compile_options(START PRIVATE -Wno-unused-parameter -Wno-conversion -Wno-sign-conversion -Wno-expansion-to-defined -Wno-implicit-fallthrough -Wno-overflow -Wno-undef)

target_include_directories(START PUBLIC" > $CMAKE

find ./ -type d | grep -iv example | cut -c 3- | while read line ; do
   echo -e "\t\${CMAKE_CURRENT_LIST_DIR}/$line" >> $CMAKE
done

echo "        )

target_sources(START PRIVATE" >> $CMAKE

find ./ -type f -name "*.c" | grep -iv example | cut -c 3- |  while read line ; do
   echo -e "\t\${CMAKE_CURRENT_LIST_DIR}/$line" >> $CMAKE
done

echo "        )" >> $CMAKE

exit 0

