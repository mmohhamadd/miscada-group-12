cmake_minimum_required(VERSION 3.14)
project(MiscadaProjectGp12Tests)

# GoogleTest requires at least C++17
set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
enable_testing()

add_subdirectory(src)
add_subdirectory(tests)
