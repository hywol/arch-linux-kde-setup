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
