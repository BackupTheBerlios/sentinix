#!/bin/sh

source ../sxarchconfig &&
source sxconfig &&
./clean.sh &&
tar -xzf gdbm-$VERSION.tar.gz &&
cd gdbm-$VERSION &&
chown -R root.root . &&
./configure \
    --prefix=/usr \
    --host=$SXARCH-$SXSYSNAME-linux &&
make CFLAGS=-O2
