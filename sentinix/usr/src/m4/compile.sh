#!/bin/sh

source ../sxarchconfig &&
source sxconfig &&
./clean.sh &&
tar -xzf m4-$VERSION.tar.gz &&
cd m4-$VERSION &&
chown -R root.root . &&
./configure \
    --prefix=/usr \
    --host=$SXARCH-$SXSYSNAME-linux &&
make CFLAGS=-O2 LDFLAGS=-s
