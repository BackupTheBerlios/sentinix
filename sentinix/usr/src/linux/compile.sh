#!/bin/sh
CWD=`pwd`

source sxconfig &&

( if [ ! -e linux-$VERSION.tar.bz2 -o ! -e config.om -o ! -e config.plain ]; then
    ln -sf ../../../isotope/src/kernels/linux-$VERSION.tar.bz2 linux-$VERSION.tar.bz2 &&
    ln -sf ../../../isotope/src/kernels/config.plain config.plain &&
    ln -sf ../../../isotope/src/kernels/config.om config.om
fi ) &&

( if [ -e linux-$VERSION ]; then
	echo "Removing old linux-$VERSION ..."
	rm -rf linux-$VERSION
fi ) &&
echo "Decompressing linux-$VERSION.tar.bz2, please wait..."
tar --use-compress-program bzip2 -xf linux-$VERSION.tar.bz2 &&
cd linux-$VERSION &&
chown -R 0.0 . &&
make mrproper &&
cp $CWD/config.plain .config &&
make include/linux/version.h &&
make symlinks
