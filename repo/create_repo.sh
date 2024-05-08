#!/bin/bash

cd repo

pacman -Sy --noconfirm git base-devel

mkdir yay-bin
chmod 777 yay-bin
runuser -unobody git clone https://aur.archlinux.org/yay-bin.git
cd yay-bin
runuser -unobody makepkg

repo-add  ../miladi.db.tar.gz *pkg.tar*
mv *pkg.tar* ../

cd ..
rm -fr yay-bin