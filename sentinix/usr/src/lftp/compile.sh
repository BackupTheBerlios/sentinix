#!/bin/sh

source ../sxarchconfig &&
source sxconfig &&
./clean.sh &&
tar -xzf lftp-$VERSION.tar.gz &&
cd lftp-$VERSION &&
chown -R root.root . &&
CFLAGS="-O2 $SXARCHFLAGS" \
CXXFLAGS="-O2 $SXARCHFLAGS" \
./configure \
    --prefix=/usr \
    --host=$SXARCH-$SXSYSNAME-linux &&
make
