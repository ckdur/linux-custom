#!/bin/bash
if [ -z "$RISCV" ]; then
  echo "RISCV not supplied."
  exit 1
fi
make -C buildroot defconfig
cp config/buildroot_defconfig buildroot/.config
make -C buildroot BR2_TOOLCHAIN_EXTERNAL_PATH=$RISCV all

