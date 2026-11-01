#!/bin/sh

cp /etc/pacman.conf /etc/pacman.conf.backup;
mline=$(grep -n "\\[multilib\\]" /etc/pacman.conf | cut -d: -f1);
rline=$(($mline + 1));
sed -i ''$mline's|#\[multilib\]|\[multilib\]|g' /etc/pacman.conf;
sed -i ''$rline's|#Include = /etc/pacman.d/mirrorlist|Include = /etc/pacman.d/mirrorlist|g' /etc/pacman.conf;
