#!/bin/sh

source ../sxarchconfig &&
source sxconfig &&
./clean.sh &&
tar -xzf shadow-$VERSION.tar.gz &&
cd shadow-$VERSION &&
chown -R root.root . &&
./configure \
    --prefix=/usr \
    --libdir=/lib \
    --host=$SXARCH-$SXSYSNAME-linux \
    --enable-shared &&
make
