cmake_minimum_required(VERSION 3.10)
project(version_it)

set(CMAKE_CXX_STANDARD 17)
add_executable(version_it main.cpp version_info.h)

add_custom_target(
    version_info.h
    COMMAND ./add_version_info.sh WORKING_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}
)
add_dependencies(version_it version_info.h)
