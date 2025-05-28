set(PROJECT_NAME hello_world)

set(CMAKE_EXE_LINKER_FLAGS "-nostdlib -static")

add_executable(${PROJECT_NAME}
    src/main.s
)

setup_arm_project(${PROJECT_NAME} TRUE)
