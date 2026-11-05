#!/bin/sh

echo "Installing Necessary components..."
{
    pacman -S mariadb cups cups-pdf sane ufw tpm2-tools zram-generator fuse2 fwupd --noconfirm;
    mariadb-install-db --user=mysql --basedir=/usr --datadir=/var/lib/mysql;
}

echo "Installing Necessary Fonts..."
{
    pacman -S noto-fonts noto-fonts-cjk noto-fonts-emoji ttf-hack ttf-dejavu ttf-liberation ttf-roboto ttf-roboto-mono ttf-ubuntu-font-family inter-font adwaita-fonts ttf-adwaitamono-nerd --noconfirm;
}

echo "Installing KDE Plasma Desktop and Essential Apps..."
{
    pacman -S plasma print-manager flatpak kdialog kolourpaint okular ebook-tools kdegraphics-mobipocket gwenview qt6-imageformats kimageformats ark zip 7zip unrar unarchiver unace openssh sshfs kdeconnect kup rsync kaddressbook kalarm korganizer kmail kontact akonadi-calendar-tools kdepim-addons kaccounts-providers kwallet kwalletmanager kate python-lsp-server konsole rust clang khelpcenter keditbookmarks dolphin dolphin-plugins kio-admin ffmpegthumbs elisa kalk kclock kweather krecorder kamoso gst-plugin-qml6 gst-plugins-bad gst-plugins-base-libs gst-plugins-good libcamera-ipa libcamera libcamera-tools spectacle xdg-desktop-portal-kde xdg-desktop-portal-gtk plasma5-integration breeze5 tuned-ppd exiv2 qt6-sensors  --noconfirm;
    pacman -S firefox libreoffice-fresh libreoffice-fresh-ko unixodbc postgresql-libs thunderbird libotr hunspell-en_us --noconfirm;
    pacman -S kpat kmines knights gnuchess kmahjongg ksudoku --noconfirm;
    pacman -S fcitx5 fcitx5-hangul fcitx5-qt fcitx5-gtk fcitx5-configtool --noconfirm;
    pacman -Rnn oxygen oxygen-sounds oxygen-icons plymouth-kcm --noconfirm;
}

echo "Setup Desktop..."
{
    cp environment /etc;
    cp zram-generator.conf /etc/systemd/;
    cp limine /etc/default;
    mkdir /etc/sddm.conf.d/;
    cp locale.conf /etc/;
    cp locale.gen /etc/;
    locale-gen;
}

echo "Enable multilib..."
{
    ./enable-multilib.sh
}

echo "Setup Chaotic-AUR..."
{
    ./chaotic-aur.sh;
}

echo "Installing Windows compatibility Layer..."
{
    pacman -S wine wine-mono wine-gecko samba lib32-libxcomposite libxcomposite lib32-pipewire-jack lib32-pipewire sdl2 --noconfirm;
}

echo "Installing Gaming Support..."
{
    pacman -S steam innoextract vkd3d lib32-vkd3d vulkan-intel lib32-vulkan-intel intel-media-driver lib32-gamemode gamemode gamescope mangohud --noconfirm;
}

echo "Install and Setup Extras..."
{
    pacman -S bibata-cursor-theme noto-color-emoji-fontconfig paru papirus-icon-theme papirus-folders ttf-sourcecodepro-nerd ttf-hack-nerd ttf-ubuntu-mono-nerd ttf-roboto-mono-nerd plymouth limine-mkinitcpio-hook --noconfirm;
    papirus-folders -C adwaita;
}

echo "Setup mkinitcpio..."
{
    mkinitcpio -P linux;
}

echo "Installing Flatpak Necessary Packages..."
{
    flatpak install -y org.freedesktop.Platform/x86_64/25.08 org.freedesktop.Platform/x86_64/26.08 org.kde.Platform/x86_64/6.10 org.kde.Platform/x86_64/6.11 org.kde.Platform/x86_64/5.15-25.08 org.gnome.Platform/x86_64/50 org.gnome.Platform/x86_64/51;
}

# echo "Setup snapper..."
# {
#    pacman -S snapper btrfs-assistant limine-snapper-sync snap-pac;
#    umount /.snapshots;
#    rm -rf /.snapshots;
#    snapper -c root create-config /;
#    btrfs subvolume delete /.snapshots;
#    rm -rf /.snapshots;
#    mkdir /.snapshots;
#    mount /.snapshots;
# }

echo "Enabling Services..."
{
    systemctl enable NetworkManager;
    systemctl enable cups;
    systemctl enable ufw;
    systemctl enable plasmalogin;
    systemctl enable mysql;
    systemctl enable bluetooth;
    systemctl enable snapper-timeline.timer;
    systemctl enable snapper-cleanup.timer;
}

echo "Finished!"

exit 0
