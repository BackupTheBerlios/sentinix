#!/bin/sh

source ../sxarchconfig &&
./clean.sh &&
tar --use-compress-program=bzip2 -xvf vim-6.2.tar.bz2 &&
cd vim62 &&
chown -R root.root . &&
CFLAGS="-O2 $SXARCHFLAGS" ./configure \
    --prefix=/usr \
    --host=$SXARCH-$SXSYSNAME-linux \
    --without-x \
    --disable-gui &&
make VIMRCLOC=/etc VIMRUNTIMEDIR=/usr/share/vim MAKE="make -e"
