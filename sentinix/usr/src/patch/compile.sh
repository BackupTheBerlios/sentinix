#!/bin/sh

source ../sxarchconfig &&
source sxconfig &&
./clean.sh &&
tar -xzf patch-$VERSION.tar.gz &&
cd patch-$VERSION &&
chown -R root.root . &&
CPPFLAGS=-D_GNU_SOURCE ./configure \
    --prefix=/usr \
    --host=$SXARCH-$SXSYSNAME-linux &&
make CFLAGS=-O2 LDFLAGS=-s
