#!/bin/sh

source ../sxarchconfig &&
source sxconfig &&
./clean.sh &&
tar -xzf make-$VERSION.tar.gz &&
cd make-$VERSION &&
chown -R root.root . &&
CFLAGS=-O2 LDFLAGS=-s ./configure \
    --prefix=/usr \
    --host=$SXARCH-$SXSYSNAME-linux &&
make
