#!/bin/sh

source ../sxarchconfig &&
source sxconfig &&
./clean.sh &&
tar --use-compress-program=bzip2 -xvf vim-$VERSION.tar.bz2 &&
cd vim${DIRVER} &&
chown -R root.root . &&
CFLAGS="-O2 $SXARCHFLAGS" ./configure \
    --prefix=/usr \
    --host=$SXARCH-$SXSYSNAME-linux \
    --without-x \
    --disable-gui &&
make VIMRCLOC=/etc VIMRUNTIMEDIR=/usr/share/vim MAKE="make -e"
