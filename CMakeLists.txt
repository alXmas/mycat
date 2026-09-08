cmake_minimum_required(VERSION 3.15)

# 2. Define the project name and set the language to C
project(MyCat LANGUAGES C)

set(CMAKE_C_STANDARD 11)
set(CMAKE_C_STANDARD_REQUIRED ON)

add_executable(mycat mycat.c)

target_compile_options(mycat PRIVATE -Wall -Wextra -Wpedantic -Werror)

if(BUILD_TESTING)
    add_executable(mycat_test mycat_test.c)
    target_compile_options(test_mycat PRIVATE -Wall -Wextra -Wpedantic -Werror)

    add_test(NAME run_core_unit_tests COMMAND mycat_test)
endif()
