#!/bin/bash

# Usage: ./run-in-container.sh <command>
# Example: ./run-in-container.sh cmake -B build -S .

set -e

IMAGE="ghcr.io/karaketir16/arm-linux-gnueabi:arm64"

#IMAGE="arm-host-arm-linux-gnueabi:latest"

WORKDIR="/workdir"

docker run --rm -it \
  -v "$(pwd):$WORKDIR" \
  -w "$WORKDIR" \
  "$IMAGE" "$@"