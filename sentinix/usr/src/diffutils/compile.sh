#!/bin/sh

source ../sxarchconfig &&
source sxconfig &&
./clean.sh &&
tar -xzf diffutils-$VERSION.tar.gz &&
cd diffutils-$VERSION &&
chown -R root.root . &&
CFLAGS="-O2 $SXARCHFLAGS" ./configure \
    --prefix=/usr \
    --host=$SXARCH-$SXSYSNAME-linux &&
make
