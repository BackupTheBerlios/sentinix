#!/bin/sh

source ../sxarchconfig &&
source sxconfig &&
./clean.sh &&
tar -xzf modutils-$VERSION.tar.gz &&
cd modutils-$VERSION &&
chown -R root.root . &&
CFLAGS="-O2 $SXARCHFLAGS" ./configure \
    --enable-strip \
    --host=$SXARCH-$SXSYSNAME-linux &&
make
