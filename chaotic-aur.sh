#!/bin/sh


pacman-key --recv-key 3056513887B78AEB --keyserver keyserver.ubuntu.com;
pacman-key --lsign-key 3056513887B78AEB;
pacman -U 'https://cdn-mirror.chaotic.cx/chaotic-aur/chaotic-keyring.pkg.tar.zst' --noconfirm;
pacman -U 'https://cdn-mirror.chaotic.cx/chaotic-aur/chaotic-mirrorlist.pkg.tar.zst' --noconfirm;
echo -e "#Chaotic-AUR" >> /etc/pacman.conf;
echo -e "" >> /etc/pacman.conf;
echo -e "[chaotic-aur]" >> /etc/pacman.conf;
echo -e "Include = /etc/pacman.d/chaotic-mirrorlist" >> /etc/pacman.conf;
pacman -Sy;
