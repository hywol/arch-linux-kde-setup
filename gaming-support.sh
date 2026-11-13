#!/bin/bash

PS3="Select your GPU: "

select menu in "Intel" "AMD Radeon" "NVIDIA" "No Gaming Support"
do
    case $menu in
        "Intel")
            pacman -S steam innoextract vkd3d lib32-vkd3d vulkan-intel lib32-vulkan-intel lib32-gamemode gamemode gamescope mangohud --noconfirm;
            break
            ;;
        "AMD Radeon")
            pacman -S steam innoextract vkd3d lib32-vkd3d vulkan-radeon lib32-vulkan-radeon lib32-gamemode gamemode gamescope mangohud --noconfirm;
            break
            ;;
        "NVIDIA")
            pacman -S steam innoextract vkd3d lib32-vkd3d nvidia-utils lib32-nvidia-utils nvidia-open-dkms lib32-gamemode gamemode gamescope mangohud --noconfirm;
            break
            ;;
        "No Gaming Support")
            echo "Gaming Supports aren't install this system."
            break
            ;;
        *)
            echo "Input vaild numbers."
            ;;
    esac
done
