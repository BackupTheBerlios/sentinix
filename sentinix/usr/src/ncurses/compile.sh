#!/bin/sh
CWD=`pwd`

source ../sxarchconfig &&
source sxconfig &&
./clean.sh &&
tar -xzvf ncurses-$VERSION.tar.gz &&
cd ncurses-$VERSION &&
chown -R root.root . &&
patch -Np1 -i $CWD/ncurses-5.3-etip.patch &&
patch -Np1 -i $CWD/ncurses-5.3-vsscanf.patch &&
./configure \
    --prefix=/usr \
    --host=$SXARCH-$SXSYSNAME-linux \
    --with-gpm \
    --with-normal \
    --with-shared \
    --without-cxx \
    --without-ada \
    --without-debug &&
make
