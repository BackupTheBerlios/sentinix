#!/bin/sh

source ../sxarchconfig &&
source sxconfig &&
./clean.sh &&
tar -xzvf bmon-$VERSION.tar.gz &&
cd bmon-$VERSION &&
chown -R root.root . &&
CFLAGS="-O2 $SXARCHFLAGS" LDFLAGS=-s ./configure \
    --host=$SXARCH-$SXSYSNAME-linux \
    --prefix=/usr &&
make &&
make install
