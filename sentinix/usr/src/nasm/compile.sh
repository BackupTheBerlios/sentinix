#!/bin/sh

source ../sxarchconfig &&
source sxconfig &&
./clean.sh &&
tar -xzvf nasm-$VERSION.tar.gz &&
cd nasm-$VERSION &&
CFLAGS=-O2 ./configure \
    --prefix=/usr \
    --host=$SXARCH-$SXSYSNAME-linux &&
make &&
make strip
