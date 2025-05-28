# ARM 32-bit Assembly Learning Project

This repository contains my learning materials and examples for 32-bit ARM assembly programming.

## Current Setup

- **Target Architecture:** 32-bit ARM (arm-linux-gnueabihf)
- **Emulation:** QEMU
- **Debugging:** GDB
- **Build System:** CMake
- **Operating System:** Linux

## Project Structure

```
.
├── CMakeLists.txt              # Main CMake configuration
├── toolchain-arm.cmake         # ARM toolchain configuration
├── common/                     # Shared headers/includes
│   └── inc/
├── hello_world/               # Hello World example
│   ├── CMakeLists.txt
│   ├── link.ld               # Linker script
│   └── src/
│       └── main.s            # Assembly source
└── build/                    # Build directory
```

## Building

```bash
# Create and enter build directory
mkdir build && cd build

# Configure CMake
cmake ..

# Build
make
```

## Debugging

Each project has its own debug script (e.g., `debug_hello_world.sh`) that:
1. Launches QEMU with GDB stub on port 1234
2. Opens GDB-multiarch connected to QEMU
3. Uses tmux to manage debugging sessions

To debug a project:

```bash
./debug_hello_world.sh
```

## Future Plans

- Bare metal ARM programming
- More example code and projects
- Additional architectures/platforms

## Requirements

- arm-linux-gnueabihf toolchain
- QEMU
- GDB multiarch
- CMake
- tmux (for debugging)