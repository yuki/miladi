#!/bin/bash

###########
#
# THIS IS A PROOF OF CONCEPT!
#
###########

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

mkdir miladi-calamares-config
chmod 777 miladi-calamares-config
runuser -unobody git clone https://github.com/yuki/miladi-calamares-config
cd miladi-calamares-config
runuser -unobody makepkg

repo-add  ../miladi.db.tar.gz *pkg.tar*
mv *pkg.tar* ../

cd ..
rm -fr miladi-calamares-config