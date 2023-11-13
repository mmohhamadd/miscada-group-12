add_subdirectory(gs)

add_executable(gs_main main.cpp)
target_link_libraries(gs_main gs)