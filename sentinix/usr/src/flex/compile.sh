#!/bin/sh

source ../sxarchconfig &&
source sxconfig &&
./clean.sh &&
tar -xjf flex-$VERSION.tar.bz2 &&
#cd flex-$VERSION &&
cd flex-2.5.4 &&
chown -R root.root . &&
./configure \
    --prefix=/usr \
    --host=$SXARCH-$SXSYSNAME-linux &&
make CFLAGS=-O2 LDFLAGS=-s
