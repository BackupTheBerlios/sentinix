#!/bin/sh

source ../sxarchconfig &&
source sxconfig &&
./clean.sh &&
tar -xzf gmp-$VERSION.tar.gz &&
cd gmp-$VERSION &&
chown -R root.root . &&
CFLAGS=-O2 ./configure \
    --prefix=/usr \
    --host=$SXARCH-$SXSYSNAME-linux \
    --with-gnu-ld &&
make
