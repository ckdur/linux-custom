#!/bin/bash
BIOS_FILE=$PWD/opensbi/build/platform/generic/firmware/fw_payload.elf
if [ ! -f "$LINUX_IMAGE" ]; then
  echo "$LINUX_IMAGE does not exists. Please run_opensbi.sh."
  exit 1
fi

cd qemu 
./configure --target-list=riscv32-softmmu
cd ..
make -C qemu -j $(nproc)
sudo -C qemu make install

#qemu-system-riscv64 -M virt -nographic -m 256M -bios $BIOS_FILE
qemu-system-riscv32 -M ratona,dumpdtb=./test_dts/qemu.dtb  -m 32M -nographic -bios ./opensbi/build/platform/ratona/firmware/fw_payload.elf -s -S
dtc -I dtb -O dts test_dts/qemu.dtb > test_dts/qemu.dts
