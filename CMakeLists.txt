cmake_minimum_required(VERSION 3.10)
project(version_it)

set(CMAKE_CXX_STANDARD 17)
add_executable(version_it main.cpp)

set(GENERATED_FILES_DIR ${CMAKE_CURRENT_BINARY_DIR}/generated)

add_custom_command (
    OUTPUT ${GENERATED_FILES_DIR}/version_info.h
    COMMAND ./add_version_info.sh ${GENERATED_FILES_DIR} WORKING_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}
)

add_custom_target(version_info DEPENDS ${GENERATED_FILES_DIR}/version_info.h)
set_source_files_properties(${GENERATED_FILES_DIR}/version_info.h GENERATED)

include_directories(${CMAKE_CURRENT_BINARY_DIR}/generated)

add_dependencies(version_it version_info)