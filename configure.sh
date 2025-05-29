#!/bin/bash

set -e

./run-in-container.sh cmake -B build -S . -DCMAKE_TOOLCHAIN_FILE=toolchain-arm.cmake
