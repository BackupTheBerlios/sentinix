#!/bin/sh

source ../sxarchconfig &&
source sxconfig &&
./clean.sh &&
tar -xzf readline-$VERSION.tar.gz &&
cd readline-$VERSION &&
./configure \
    --prefix=/usr \
    --host=$SXARCH-$SXSYSNAME-linux \
    --with-curses &&
make CFLAGS=-O2 LDFLAGS=-s static shared
