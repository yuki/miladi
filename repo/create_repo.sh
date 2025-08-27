#!/bin/bash

###########
#
# The creation of the packages for Miladi's repo
#
###########

PACKAGES=(
    "https://aur.archlinux.org/yay-bin.git yay-bin"
    "https://gitlab.manjaro.org/packages/extra/calamares.git calamares"
    "https://github.com/yuki/miladi-calamares-config miladi-calamares-config"
    "https://github.com/yuki/miladi-live-service.git miladi-live-service"
)


create_package() {
    url="$1"
    name="$2"

    mkdir $name
    chmod 777 $name
    runuser -unobody git clone $url
    cd $name
    source PKGBUILD && yay -Syu --noconfirm --needed --asdeps "${makedepends[@]}" "${depends[@]}"
    runuser -unobody makepkg

    mv *pkg.tar* ../

    cd ..
    rm -fr $name
}


cd repo

# added chaotic-repo for some dependencies https://aur.chaotic.cx/docs
pacman -Sy
pacman-key --init
pacman-key --recv-key 3056513887B78AEB --keyserver keyserver.ubuntu.com
pacman-key --lsign-key 3056513887B78AEB
pacman -U --noconfirm 'https://cdn-mirror.chaotic.cx/chaotic-aur/chaotic-keyring.pkg.tar.zst'
pacman -U --noconfirm 'https://cdn-mirror.chaotic.cx/chaotic-aur/chaotic-mirrorlist.pkg.tar.zst'
echo "[chaotic-aur]" >> /etc/pacman.conf
echo "Include = /etc/pacman.d/chaotic-mirrorlist" >> /etc/pacman.conf

# added installation for yay-bin
pacman -Sy --noconfirm --needed git base-devel
git clone https://aur.archlinux.org/yay-bin.git
chmod 777 yay-bin
cd yay-bin
runuser -unobody makepkg
pacman -U --noconfirm *pkg.tar*
cd ..


for value in "${PACKAGES[@]}"; do
  create_package $value
done


# we need the package ckbcomp in the repository
cp /var/cache/pacman/pkg/ckbcomp*zst .
repo-add  miladi.db.tar.gz *pkg.tar.zst
