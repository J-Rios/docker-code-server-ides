### Project General CMakeLists File ###

###############################################################################

### CMake Configuration ###

cmake_minimum_required(VERSION 3.18)
set(CMAKE_C_STANDARD 11)

###############################################################################

### Project Configuration ###

# Project Name
project(hello_world)
set(PRJ_OUT_FILE hello_world)

###############################################################################

### Build Options ###


###############################################################################

### Build Configuration ###

# Enable Assembly
#enable_language(ASM)

# Global Defines to be passed to Compiler (-DFLAG=X)
add_compile_definitions(
    TEST_ENABLE=1
)

# Debug Build Target
if(CMAKE_BUILD_TYPE MATCHES Debug)
message("Build Type: Debug")
    add_compile_definitions(DEBUG=1)
    add_compile_definitions(DEBUG_LEVEL=4)
    add_compile_definitions(TEST)
endif(CMAKE_BUILD_TYPE MATCHES Debug)

# Release Build Target
if(CMAKE_BUILD_TYPE MATCHES Release)
    message("Build Type: Release")
    add_compile_definitions(RELEASE=1)
endif(CMAKE_BUILD_TYPE MATCHES Release)

###############################################################################

### Directories and Sources To Use ###

# Sources files
set(SRC_FILES
    ${STARTUP_FILE}
    src/main.c
)

# Build executable binary
add_executable(${PRJ_OUT_FILE}.elf ${SRC_FILES})

# Libraries for linkage (-lLIBRARY)
target_link_libraries(${PRJ_OUT_FILE}.elf
    # None
)

###############################################################################

### Build Target Properties ###


###############################################################################

### Build Output Files ###

# Binary file build (file.bin)
add_custom_target(${PRJ_OUT_FILE}.bin ALL
    COMMAND ${CC}-objcopy -O binary
    ${PRJ_OUT_FILE}.elf ${PRJ_OUT_FILE}.bin
    DEPENDS ${PRJ_OUT_FILE}.elf)

# Hexadecimal file build (file.hex)
add_custom_target(${PRJ_OUT_FILE}.hex ALL
    COMMAND ${CC}-objcopy -O ihex
    ${PRJ_OUT_FILE}.elf ${PRJ_OUT_FILE}.hex
    DEPENDS ${PRJ_OUT_FILE}.elf)

# Symbols Table list file build (file.symtab)
add_custom_target(${PRJ_OUT_FILE}.symtab ALL
    COMMAND ${CC}-nm -n -l -a
    ${PRJ_OUT_FILE}.elf >> ${PRJ_OUT_FILE}.symtab
    DEPENDS ${PRJ_OUT_FILE}.elf)

# Show Build result memory size
add_custom_target(size_calculation ALL
    COMMAND ${CC}-size ${PRJ_OUT_FILE}.elf
    DEPENDS ${PRJ_OUT_FILE}.elf)
