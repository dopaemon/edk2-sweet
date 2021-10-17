Attempt to create a minimal EDK2 for SM8250 (Transplanted from Pixel3XL).

[![Build Status](https://dev.azure.com/zhuoweizhang/edk2-pixel3/_apis/build/status/Pixel3Dev.edk2-pixel3?branchName=master)](https://dev.azure.com/zhuoweizhang/edk2-pixel3/_build/latest?definitionId=1&branchName=master)

## Status
Because some dxe conflicts lead to hwio/map problems, uefi is incomplete, only ufs works, and if it is sometimes repaired later, Linux will have usb power supply directly.
As to Windows, minimal has proved that it is no longer effective in 7150 warehouse. if minimal acpi is used, the equipment will stay at the logo, and sc8280 equipment will appear soon, but unfortunately, it is probably on the same platform as sm8350.
Therefore, 8250 doesn't want Windows anymore, it's quite difficult. After that, it will make some adjustments on QRD to verify some problems, which will only make Linux better. Windows is very difficult to start, even if it is started, it's not very useful, and it doesn't have a similar wp platform.


Boot Windows is stuck in the logo



Boot Linux must add kernel parameters:clk_ignore_unused

## Building
Tested on Ubuntu 18.04.

First, clone EDK2.

```
cd ..
git clone https://github.com/tianocore/edk2.git --recursive
git clone https://github.com/tianocore/edk2-platforms.git
```

You should have all three directories side by side.

Next, install dependencies:

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
