cmake_minimum_required(VERSION 3.15)

# 2. Define the project name and set the language to C
project(MyCat LANGUAGES C)

set(CMAKE_C_STANDARD 11)
set(CMAKE_C_STANDARD_REQUIRED ON)

add_executable(mycat mycat.c)

