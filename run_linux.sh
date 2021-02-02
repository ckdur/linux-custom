#!/bin/bash
make -C linux defconfig
cp config/linux_defconfig linux/.config
make -C linux all

