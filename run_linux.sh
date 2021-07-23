#!/bin/bash
if [ -z "$XLEN" ]; then
  echo "XLEN not supplied."
  exit 1
fi
INITRAMFS_SOURCE=$PWD/buildroot/output/images/rootfs.cpio.gz
if [ ! -f "$INITRAMFS_SOURCE" ]; then
    echo "$INITRAMFS_SOURCE does not exists. Please run_buildroot.sh."
  exit 1
fi
export CROSS_COMPILE=riscv${XLEN}-unknown-linux-gnu-
export PLATFORM_RISCV_XLEN=${XLEN}
export ARCH=riscv
make -C linux rv32_defconfig
cp config/linux${XLEN}_defconfig linux/.config
make -C linux CONFIG_INITRAMFS_SOURCE=$INITRAMFS_SOURCE all

