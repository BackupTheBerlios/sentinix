#!/bin/sh

source ../sxarchconfig &&
source sxconfig &&
./clean.sh &&
tar -xzf sed-$VERSION.tar.gz &&
cd sed-$VERSION &&
chown -R root.root . &&
./configure \
    --prefix=/usr \
    --bindir=/bin \
    --host=$SXARCH-$SXSYSNAME-linux &&
make CFLAGS=-O2 LDFLAGS=-s
