# arch-linux-kde-setup

Arch Linux with KDE Plasma Installation Kit / 아치 리눅스 + KDE Plasma 데스크탑 설치 키트

## How to Use

First, use [arch-linux-auto-install](https://github.com/hywol/arch-linux-auto-install) script.

먼저, [arch-linux-auto-install](https://github.com/hywol/arch-linux-auto-install) 스크립트를 사용하세요.

## How to Custom with your system

This script can install Gaming support.

if you using Intel CPU, change limine config file.

```
KERNEL_CMDLINE[default]+=rw root=/dev/nvme0n1p2 rootflags=subvol=/@ initrd=/intel-ucode.img
```

## Provide Features

 * Default Arch Linux wallpaper [source](https://github.com/thr3d33/archlinux-artwork/blob/main/wallpapers/archlinux/dual-screen/5120x2880/arch-dual-gradient-left-5120x2880.png)
 * Necessary Gaming Packages out-of-box
    * Some Default Games
 * Gaming Support with Steam 
 * Fcitx5 IME Included for CJK Language Input

## Sources

 * Wallpaper
 * Settings file
