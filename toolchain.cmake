set(CMAKE_SYSTEM_NAME Generic)
set(CMAKE_SYSTEM_PROCESSOR arm)

set(CMAKE_C_STANDARD 99)
set(CMAKE_CXX_STANDARD 17)

set(TOOLCHAIN arm-none-eabi)
set(TOOLCHAIN_PREFIX "/usr")

set(TOOLCHAIN_INC_DIR ${TOOLCHAIN_PREFIX}/${TOOLCHAIN}/include)
set(TOOLCHAIN_LIB_DIR ${TOOLCHAIN_PREFIX}/${TOOLCHAIN}/lib)

set(CMAKE_C_COMPILER
    "/usr/bin/arm-none-eabi-gcc"
    CACHE INTERNAL "C Compiler")

set(CMAKE_CXX_COMPILER
    "/usr/bin/arm-none-eabi-g++"
    CACHE INTERNAL "C++ Compiler")

set(CMAKE_ASM_COMPILER
    "/usr/bin/arm-none-eabi-gcc"
    CACHE INTERNAL "ASM Compiler")

set(CMAKE_LINKER
    "/usr/bin/arm-none-eabi-ld"
    CACHE INTERNAL "Linker")

set(CMAKE_FIND_ROOT_PATH ${TOOLCHAIN_PREFIX}/${${TOOLCHAIN}}
                         ${CMAKE_PREFIX_PATH})
set(CMAKE_FIND_ROOT_PATH_MODE_PROGRAM NEVER)
set(CMAKE_FIND_ROOT_PATH_MODE_LIBRARY ONLY)
set(CMAKE_FIND_ROOT_PATH_MODE_INCLUDE ONLY)
set(CMAKE_FIND_ROOT_PATH_MODE_PACKAGE ONLY)

set(LINKER_SCRIPT
    "${CMAKE_CURRENT_LIST_DIR}/Project_Settings/Linker_Files/MK70FN1M0_ram.ld")
