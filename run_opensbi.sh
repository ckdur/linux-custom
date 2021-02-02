#!/bin/bash
LINUX_IMAGE=$PWD/linux/arch/riscv/boot/Image
if [ ! -f "$LINUX_IMAGE" ]; then
    echo "$LINUX_IMAGE does not exists. Please run_linux.sh."
fi
make -C opensbi PLATFORM=generic FW_PAYLOAD_PATH=$LINUX_IMAGE

