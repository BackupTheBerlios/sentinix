#!/bin/sh

source ../sxarchconfig &&
source sxconfig &&
./clean.sh &&
tar -xvzf gdb-$VERSION.tar.gz &&
cd gdb-$VERSION &&
chown -R root.root . &&
CFLAGS="$SXARCHFLAGS" ./configure \
    --prefix=/usr \
    --host=$SXARCH-$SXSYSNAME-linux &&
make
