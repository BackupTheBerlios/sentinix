#!/bin/sh

source ../sxarchconfig &&
source sxconfig &&
./clean.sh &&
echo "Uncompressing Python-$VERSION ..." &&
tar -xjf Python-$VERSION.tar.bz2 &&
cd Python-$VERSION &&
chown -R root.root . &&
CFLAGS="-O2 $SXARCHFLAGS" ./configure \
    --prefix=/usr \
    --host=$SXARCH-$SXSYSNAME-linux &&
make
