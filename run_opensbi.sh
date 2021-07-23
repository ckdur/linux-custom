#!/bin/bash
if [ -z "$XLEN" ]; then
  echo "XLEN not supplied."
  exit 1
fi
export CROSS_COMPILE=riscv${XLEN}-unknown-linux-gnu-
export PLATFORM_RISCV_XLEN=${XLEN}
LINUX_IMAGE=$PWD/linux/arch/riscv/boot/Image
if [ ! -f "$LINUX_IMAGE" ]; then
  echo "$LINUX_IMAGE does not exists. Please run_linux.sh."
  exit 1
fi
make -C opensbi PLATFORM=generic FW_PAYLOAD_PATH=$LINUX_IMAGE

