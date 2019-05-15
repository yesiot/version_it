cmake_minimum_required(VERSION 3.10)
project(version_it)

set(CMAKE_CXX_STANDARD 17)

set(GENERATED_FILES_DIR ${CMAKE_CURRENT_BINARY_DIR}/generated)

include_directories(${GENERATED_FILES_DIR})

add_custom_command(OUTPUT ${GENERATED_FILES_DIR}/version_info.h
                   COMMAND ./add_version_info.sh ${GENERATED_FILES_DIR} WORKING_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}
                   DEPENDS ${CMAKE_CURRENT_SOURCE_DIR}/.git/logs/HEAD)

add_custom_target(version_info
                  DEPENDS ${GENERATED_FILES_DIR}/version_info.h)

#set_source_files_properties(${GENERATED_FILES_DIR}/version_info.h GENERATED)

add_executable(version_it main.cpp)

add_dependencies(version_it version_info)