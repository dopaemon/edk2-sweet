Attempt to create a minimal EDK2 for Redmi K20/MI 9T (Transplanted from Pixel3XL).

Snapdragon 730

## Status
Can boot winpe
UFS
USB(need powered usb hub)

Boot Linux must add kernel parameters:clk_ignore_unused

## Building

Install dependencies:

18.04:

```
sudo apt install build-essential uuid-dev iasl git nasm python3-distutils gcc-aarch64-linux-gnu abootimg
```

Also see [EDK2 website](https://github.com/tianocore/tianocore.github.io/wiki/Using-EDK-II-with-Native-GCC#Install_required_software_from_apt)

Finally, ./build.sh.

Then fastboot boot boot_uefi.img.
If you encounter a problem that you can't compile, use the old edk2 source code, because this library hasn't been updated for some time.

# Credits

SimpleFbDxe screen driver is from imbushuo's [Lumia950XLPkg](https://github.com/WOA-Project/Lumia950XLPkg).
