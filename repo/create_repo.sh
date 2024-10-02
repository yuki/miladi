#!/bin/bash

###########
#
# The creation of the packages for Miladi's repo
#
###########

cd repo

PACKAGES=(
    "https://aur.archlinux.org/yay-bin.git yay-bin"
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
    runuser -unobody makepkg

    repo-add  ../miladi.db.tar.gz *pkg.tar*
    mv *pkg.tar* ../

    cd ..
    rm -fr $name
}

pacman -Sy --noconfirm git base-devel

for value in "${PACKAGES[@]}"; do
  create_package $value
done
