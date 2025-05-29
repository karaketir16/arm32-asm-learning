cmake_minimum_required(VERSION 3.16)
project(ARMProjects C ASM)

enable_language(ASM)

# Function to setup ARM project build and debug
function(setup_arm_project PRJ_NAME LINK)
if(${LINK})
    set_target_properties(${PRJ_NAME} PROPERTIES LINK_DEPENDS "${CMAKE_CURRENT_SOURCE_DIR}/link.ld")
    target_link_options(${PRJ_NAME} PRIVATE -T${CMAKE_CURRENT_SOURCE_DIR}/link.ld)
endif()

    # set(CMAKE_C_FLAGS "-march=armv7-a -mfloat-abi=hard -mfpu=vfpv3-d16" CACHE STRING "" FORCE)
    # set(CMAKE_C_FLAGS "-march=armv7-a" CACHE STRING "" FORCE)

    set(CMAKE_C_FLAGS "-march=armv7-a -mfloat-abi=soft" CACHE STRING "" FORCE)
    set(CMAKE_ASM_FLAGS "-march=armv7-a" CACHE STRING "" FORCE)


    # Add post-build commands for disassembly and binary creation
    add_custom_command(TARGET ${PRJ_NAME} POST_BUILD
        COMMAND ${CMAKE_OBJDUMP} -D ${PRJ_NAME} > ${PRJ_NAME}.dump_all
        COMMAND ${CMAKE_OBJDUMP} -d ${PRJ_NAME} > ${PRJ_NAME}.dump
        COMMAND ${CMAKE_OBJCOPY} -O binary ${PRJ_NAME} ${PRJ_NAME}.bin
        COMMENT "Creating disassembly and binary for ${PRJ_NAME}"
    )

    # Create debug script
    set(DEBUG_SCRIPT ${CMAKE_CURRENT_BINARY_DIR}/debug_${PRJ_NAME}.sh)
    file(WRITE ${DEBUG_SCRIPT} "#!/bin/bash\n")
    file(APPEND ${DEBUG_SCRIPT} "SESSION=debug_${PRJ_NAME}\n")
    file(APPEND ${DEBUG_SCRIPT} "tmux new-session -s \$SESSION -n qemu \"qemu-arm -cpu cortex-a7 -g 1234 ${CMAKE_CURRENT_BINARY_DIR}/${PRJ_NAME};read\" \\;\\\n")
    file(APPEND ${DEBUG_SCRIPT} "     new-window -n gdb \"gdb-multiarch ${CMAKE_CURRENT_BINARY_DIR}/${PRJ_NAME} -ex 'target remote localhost:1234';read\" \\;\n")

    # Make debug script executable
    execute_process(COMMAND chmod +x ${DEBUG_SCRIPT})
endfunction()

# Optional shared headers or sources
include_directories(${CMAKE_SOURCE_DIR}/common/inc)

# Add subprojects
add_subdirectory(hello_world)
add_subdirectory(saturate)