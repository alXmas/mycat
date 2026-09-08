cmake_minimum_required(VERSION 3.15)

# 2. Define the project name and set the language to C
project(MyCat LANGUAGES C)

set(CMAKE_C_STANDARD 11)
set(CMAKE_C_STANDARD_REQUIRED ON)

add_executable(mycat mycat.c)

target_compile_options(mycat PRIVATE -Wall -Wextra -Wpedantic -Werror)


include(CTest)

add_test(
  NAME run_functional_bash_tests 
  COMMAND ${BASH_PROGRAM} "${CMAKE_CURRENT_SOURCE_DIR}/run_tests.sh"
)
