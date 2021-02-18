#!/bin/bash
dtc -I dts -O dtb -o test.dtb test.dts
dtc -I dts -O dtb -o testBoom.dtb testBoom.dts
dtc -I dts -O dtb -o testNewBoom.dtb testNewBoom.dts
dtc -I dts -O dtb -o testMicroConfig.dtb testMicroConfig.dts

