#!/bin/bash -x

pacman --remove --noconfirm virtualbox-guest-utils-nox

pacman --sync --refresh --sysupgrade --noconfirm --ignore linux

pacman --sync --needed --noconfirm \
    fish dash python php \
    virtualbox-guest-utils \
    xorg-server xorg-utils xorg-xinit xorg-xrdb mesa-libgl xf86-input-evdev libx264 \
    i3-wm i3lock i3status rxvt-unicode rxvt-unicode-terminfo \
    firefox firefox-i18n-fr thunderbird thunderbird-i18n-fr \
    libreoffice-fresh libreoffice-fresh-fr \
    gvim vim-spell-fr gksu \
    ttf-inconsolata ttf-liberation gnu-free-fonts \
    pulseaudio pulseaudio-alsa pavucontrol paprefs pamixer alsa-utils \
    spacefm udevil lsof davfs2 nfs-utils sshfs curlftpfs cifs-utils \
    wget flashplugin epdfview \
    rofi xautolock numlockx dunst libnotify nitrogen \
    keepass syncthing gnome-keyring \
    git tk \
    docker docker-compose lxc \
    gtk-theme-switch2 gnome-themes-standard \
    netbeans jdk8-openjdk

echo LANG=fr_FR.UTF-8 >/etc/locale.conf
echo fr_FR.UTF-8 >/etc/locale.gen
locale-gen
localectl set-x11-keymap fr

ln -snf /usr/share/zoneinfo/Europe/Paris /etc/localtime

cat <VCONSOLE >/etc/vconsole.conf
KEYMAP=fr
FONT=lat9w-16
FONT_MAP=8859-15
VCONSOLE

systemctl enable docker

useradd --create-home --user-group --groups docker,adm,wheel,disk,log,vagrant --shell /usr/bin/fish $CREATE_USER
passwd -e $CREATE_USER

su - $CREATE_USER <<'USERSETUP'
mkdir -p bin .ssh .composer
cd .config
git init .
git remote add origin https://github.com/Adirelle/XSessionConfig.git
git fetch origin arch-vbox
git checkout arch-vbox
cd $HOME
for f in xinitrc Xresources; ln -s  .config/i3/session/.$f $f; end
USERSETUP


reboot
