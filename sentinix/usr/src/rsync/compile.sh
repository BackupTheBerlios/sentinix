#!/bin/sh

source ../sxarchconfig &&
source sxconfig &&
./clean.sh &&
tar -xzf rsync-$VERSION.tar.gz &&
cd rsync-$VERSION &&
CFLAGS="-O2 $SXARCHFLAGS -fstack-protector" ./configure \
    --prefix=/usr \
    --host=$SXARCH-$SXSYSNAME-linux &&
make
