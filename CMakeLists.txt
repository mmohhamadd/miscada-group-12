cmake_minimum_required(VERSION 3.10)
project(MiscadaProjectGp12)

set(CMAKE_CXX_STANDARD 11)
set(CMAKE_CXX_STANDARD_REQUIRED True)

#find already installed GoogleTest Packages
find_package(GTest REQUIRED)
include_directories(${GTEST_INCLUDE_DIRS})

# Add executable for the main program
add_executable(MiscadaProjectGp12 gs.cpp)

# Add executable for the tests
add_executable(MiscadaProjectGp12Tests test.cpp gs.cpp)
# 2 executable files should be compiled, Because there are 2 main function in the project
target_compile_definitions(MiscadaProjectGp12Tests PRIVATE TESTS)
target_link_libraries(MiscadaProjectGp12Tests ${GTEST_LIBRARIES} pthread)