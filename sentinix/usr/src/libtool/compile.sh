#!/bin/sh

source ../sxarchconfig &&
source sxconfig &&
./clean.sh &&
tar -xzf libtool-$VERSION.tar.gz &&
cd libtool-$VERSION &&
chown -R root.root . &&
CFLAGS=-O2 ./configure \
    --prefix=/usr \
    --host=$SXARCH-$SXSYSNAME-linux &&
make
