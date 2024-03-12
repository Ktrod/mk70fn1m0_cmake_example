if(NOT DEFINED LINKER_SCRIPT)
  message(FATAL_ERROR "No linker script defined")
endif(NOT DEFINED LINKER_SCRIPT)
message("Linker script: ${LINKER_SCRIPT}")

if(NOT DEFINED ENV{EWL_LIB_PATH})
  message(FATAL_ERROR "EWL_LIB_PATH missing from env")
endif(NOT DEFINED ENV{EWL_LIB_PATH})
message("Ewl lib found: $ENV{EWL_LIB_PATH}")

# ---------------------------------------------------------------------------------------
# Set compiler/linker flags
# ---------------------------------------------------------------------------------------
#

set(LIB_INCLUDES "$ENV{EWL_LIB_PATH}/EWL_Runtime/include"
                 "$ENV{EWL_LIB_PATH}/EWL_C/include")

target_include_directories(MyOS PUBLIC "${LIB_INCLUDES}")

set(LIB_FPU "$ENV{EWL_LIB_PATH}/lib/armv7e-m/fpu")

set(LIB_ARMV7E "$ENV{EWL_LIB_PATH}/lib/armv7e-m")

# Object build options
set(OBJECT_GEN_FLAGS
    "-mcpu=cortex-m4 \
    -mthumb \
    -mfloat-abi=hard \
    -mfpu=fpv4-sp-d16 \
    -ffunction-sections \
    -fdata-sections \
    -Wall \
    -Wextra \
    -fsigned-char \
    -fmessage-length=0 \
    -D__VFPV4__ \
    -D__SEMIHOSTING \
    -specs=ewl_c_hosted.specs")

set(CMAKE_C_FLAGS
    "${OBJECT_GEN_FLAGS} -std=gnu99 "
    CACHE INTERNAL "C Compiler options")

set(CMAKE_EXE_LINKER_FLAGS
    "-mcpu=cortex-m4 \
    -mthumb \
    -mfloat-abi=hard \
    -mfpu=fpv4-sp-d16 \
    -g3 \
    -gdwarf-2 \
    -gstrict-dwarf \
    -T${LINKER_SCRIPT} \
    -Xlinker \
    --gc-sections \
    -Wl,-Map=${CMAKE_PROJECT_NAME}.map \
    -L${LIB_FPU} \
    -L${LIB_ARMV7E} \
    -n \
    -Xlinker \
    --undefined=__pformatter_ \
    -Xlinker \
    --defsym=__pformatter=__pformatter_ \
    -Xlinker \
    --undefined=__sformatter \
    -Xlinker \
    --defsym=__sformatter=__sformatter"
    CACHE INTERNAL "Linker options")
