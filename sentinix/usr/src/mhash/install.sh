#!/bin/sh

source ../sxarchconfig &&
source sxconfig &&
./clean.sh &&
tar -xzf mhash-$VERSION.tar.gz &&
cd mhash-$VERSION &&
chown -R root.root . &&
CFLAGS="-O2 $SXARCHFLAGS" ./configure \
    --prefix=/usr \
    --host=$SXARCH-$SXSYSNAME-linux &&
make &&
make install &&
ldconfig
