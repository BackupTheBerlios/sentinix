#!/bin/sh

source ../sxarchconfig &&
source sxconfig &&
./clean.sh &&
tar -xzf texinfo-$VERSION.tar.gz &&
cd texinfo-$VERSION &&
chown -R root.root . &&
CFLAGS=-O2 ./configure \
    --prefix=/usr \
    --host=$SXARCH-$SXSYSNAME-linux &&
make
