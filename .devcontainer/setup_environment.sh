# Script to setup the dev tools
# This should be run as root, or using sudo

# 1. Install "devkitARM"
## Install pacman
apk add pacman

## Update pacman install to allow installing devkitARM
pacman-key --init

DEVKITPRO=/opt/devkitpro
DEVKITARM=/opt/devkitpro/devkitARM
DEVKITPPC=/opt/devkitpro/devkitPPC

pacman-key --recv BC26F752D25B92CE272E0F44F7FD5492264BB9D0 --keyserver keyserver.ubuntu.com
pacman-key --lsign BC26F752D25B92CE272E0F44F7FD5492264BB9D0

pacman --noconfirm -U https://pkg.devkitpro.org/devkitpro-keyring.pkg.tar.zst

## Add devkit pro repos
echo "[dkp-libs]" > /etc/pacman.conf
echo "Server = https://pkg.devkitpro.org/packages" > /etc/pacman.conf

echo "[dkp-linux-musl]" > /etc/pacman.conf
echo "Server =  https://pkg.devkitpro.org/packages/linux-musl/$arch/" > /etc/pacman.conf

## Install devkitPro pacman
pacman -Syu

## finally install the GBA dev tools
dkp-pacman --noconfirm -S gba-dev

# 2. Install a GBA emulator for debugging
apk add flatpak
flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo
flatpak install --assumeyes flathub io.mgba.mGBA
