set(PROJECT_NAME saturate)

set(CMAKE_EXE_LINKER_FLAGS "-static")

add_executable(${PROJECT_NAME}
    src/main.s
    src/main.c
)

setup_arm_project(${PROJECT_NAME} FALSE)
