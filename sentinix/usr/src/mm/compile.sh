#!/bin/sh

source ../sxarchconfig &&
source sxconfig &&
./clean.sh &&
tar -xzf mm-$VERSION.tar.gz &&
cd mm-$VERSION &&
./configure \
    --prefix=/usr \
    --host=$SXARCH-$SXSYSNAME-linux \
    --enable-shared \
    --disable-shared &&
make &&
make test
