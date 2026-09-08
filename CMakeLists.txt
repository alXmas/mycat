cmake_minimum_required(VERSION 3.15)

project(MyCat LANGUAGES C)

set(CMAKE_C_STANDARD 11)
set(CMAKE_C_STANDARD_REQUIRED ON)

add_executable(mycat mycat.c)

target_compile_options(mycat PRIVATE -Wall -Wextra -Wpedantic -Werror)

include(CTest)

find_program(BASH_PROGRAM bash REQUIRED)

add_test(
  NAME run_functional_bash_tests 
  COMMAND ${BASH_PROGRAM} "${CMAKE_CURRENT_SOURCE_DIR}/tests/run_tests.sh" "$<TARGET_FILE:mycat>"
)

