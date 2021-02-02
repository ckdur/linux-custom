#!/bin/bash
BIOS_FILE=$PWD/opensbi/build/platform/generic/firmware/fw_payload.elf
if [ ! -f "$LINUX_IMAGE" ]; then
    echo "$LINUX_IMAGE does not exists. Please run_linux.sh."
fi
qemu-system-riscv64 -M virt -nographic -m 256M -bios $BIOS_FILE

