#!/bin/sh

source ../sxarchconfig &&
source sxconfig &&
./clean.sh &&
tar -xzf parted-$VERSION.tar.gz &&
cd parted-$VERSION &&
chown -R root.root . &&
CFLAGS="-O2 $SXARCHFLAGS" LDFLAGS=-s ./configure \
    --prefix=/usr \
    --with-readline \
    --host=$SXARCH-$SXSYSNAME-linux &&
make
