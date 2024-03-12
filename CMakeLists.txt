cmake_minimum_required(VERSION 3.28)

set(CMAKE_BUILD_TYPE "Debug")
set(CMAKE_TRY_COMPILE_TARGET_TYPE "STATIC_LIBRARY")
set(CMAKE_EXPORT_COMPILE_COMMANDS
    ON
    CACHE INTERNAL "")

project(MyOS C CXX ASM)

add_executable(MyOS Sources/main.c)
set_target_properties(${CMAKE_PROJECT_NAME}
                      PROPERTIES OUTPUT_NAME "${CMAKE_PROJECT_NAME}.elf")

include(toolchain.cmake)
include(mk70f12.cmake)

add_subdirectory(Sources)
add_subdirectory(Project_Settings/Startup_Code)

target_include_directories(MyOS PUBLIC Project_Settings/Startup_Code)
target_include_directories(MyOS PUBLIC Project_Headers)
