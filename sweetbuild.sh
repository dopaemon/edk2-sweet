#!/bin/bash
# based on the instructions from edk2-platform
set -e
. build_common.sh
PYTHON_COMMAND=python2.7
rm -rf workspace/Build/F11/DEBUG_GCC5/FV/Ffs/7E374E25-8E01-4FEE-87F2-390C23C606CDFVMAIN
GCC5_AARCH64_PREFIX=aarch64-linux-gnu- build -s -n 0 -a AARCH64 -t GCC5 -p F11/sweet.dsc
gzip -c < Build/F11/DEBUG_GCC5/FV/F11_UEFI.fd >uefi_image5
cat sweet.dtb >> uefi_image5
abootimg --create sweet_uefi.img -k uefi_image5 -r ramdisk-null -f bootimg.cfg
rm uefi_image* Build/ -rf
