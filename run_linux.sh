#!/bin/bash
INITRAMFS_SOURCE=$PWD/buildroot/output/images/rootfs.cpio.gz
if [ ! -f "$INITRAMFS_SOURCE" ]; then
    echo "$INITRAMFS_SOURCE does not exists. Please run_buildroot.sh."
  exit 1
fi
make -C linux defconfig
cp config/linux_defconfig linux/.config
make -C linux CONFIG_INITRAMFS_SOURCE=$INITRAMFS_SOURCE all

