#!/bin/sh

source ../sxarchconfig &&
source sxconfig &&
./clean.sh &&
tar -xzf radiusclient-$VERSION.tar.gz &&
cd radiusclient-$VERSION &&
chown -R root.root . &&
CFLAGS="-O2 $SXARCHFLAGS" LDFLAGS=-s ./configure \
    --prefix=/usr \
    --host=$SXARCH-$SXSYSNAME-linux &&
make
