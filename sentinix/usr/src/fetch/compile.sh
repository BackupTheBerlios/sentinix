#!/bin/sh

source ../sxarchconfig &&
source sxconfig &&
./clean.sh &&
tar -xzf fetch-$VERSION.tar.gz &&
cd fetch-$VERSION &&
chown -R root.root . &&
CFLAGS="-O2 $SXARCHFLAGS" \
LDFLAGS=-s \
./configure \
    --prefix=/usr \
    --sysconfdir=/etc \
    --host=$SXARCH-$SXSYSNAME-linux &&
make
