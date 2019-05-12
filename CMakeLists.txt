cmake_minimum_required(VERSION 3.10)
project(version_it)

set(CMAKE_CXX_STANDARD 17)
add_executable(version_it main.cpp)


add_custom_command (
    OUTPUT ${CMAKE_CURRENT_BINARY_DIR}/version_info.h
    COMMAND ./add_version_info.sh ${CMAKE_CURRENT_BINARY_DIR} WORKING_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}
)

add_custom_target(version_info DEPENDS ${CMAKE_CURRENT_BINARY_DIR}/version_info.h)
set_source_files_properties(${CMAKE_CURRENT_BINARY_DIR}/version_info.h GENERATED)

include_directories(${CMAKE_CURRENT_BINARY_DIR})

add_dependencies(version_it version_info)