#!/bin/sh

source ../sxarchconfig &&
source sxconfig &&
./clean.sh &&
tar -xzf grep-$VERSION.tar.gz &&
cd grep-$VERSION &&
chown -R root.root . &&
CFLAGS=-O2 ./configure \
    --prefix=/usr \
    --bindir=/bin \
    --host=$SXARCH-$SXSYSNAME-linux \
    --with-included-regex &&
make
