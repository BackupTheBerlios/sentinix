#!/bin/sh

source ../sxarchconfig &&
source sxconfig &&
./clean.sh &&
tar -xjvf ngrep-$VERSION.tar.bz2 &&
cd ngrep-$VERSION &&
chown -R root.root . &&
CFLAGS="-O2 $SXARCHFLAGS" ./configure \
    --prefix=/usr \
    --host=$SXARCH-$SXSYSNAME-linux &&
make &&
make install
