#!/bin/sh

source ../sxarchconfig &&
source sxconfig &&
./clean.sh &&
tar -xjf gzip-$VERSION.tar.bz2 &&
cd gzip-$VERSION &&
CFLAGS="-O2 $SXARCHFLAGS" ./configure \
    --prefix=/usr \
    --host=$SXARCH-$SXSYSNAME-linux &&
cp gzexe.in{,.backup} &&
sed 's%"BINDIR"%/bin%' gzexe.in.backup > gzexe.in &&
make &&
strip gzip
