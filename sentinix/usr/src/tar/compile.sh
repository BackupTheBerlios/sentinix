#!/bin/sh

source ../sxarchconfig &&
source sxconfig &&
./clean.sh &&
tar -xzf tar-$VERSION.tar.gz &&
cd tar-$VERSION &&
chown -R root.root . &&
CFLAGS=-O2 ./configure \
    --prefix=/usr \
    --libexecdir=/usr/bin \
    --bindir=/bin \
    --host=$SXARCH-$SXSYSNAME-linux &&
make
