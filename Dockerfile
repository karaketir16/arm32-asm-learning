from ubuntu:24.04
# Install dependencies

RUN apt update && \
    DEBIAN_FRONTEND=noninteractive apt install -y \
    cmake \
    tmux \
    git \
    openssh-client \
    gdb-multiarch \
    gcc-arm-linux-gnueabi \
    binutils-arm-linux-gnueabi \
    qemu-user \
    qemu-system-arm && \
    rm -rf /var/lib/apt/lists/*