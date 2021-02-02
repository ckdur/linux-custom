#!/bin/bash
make -C buildroot defconfig
cp config/buildroot_defconfig buildroot/.config
make -C buildroot all

