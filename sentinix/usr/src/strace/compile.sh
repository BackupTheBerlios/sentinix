#!/bin/sh

source ../sxarchconfig &&
source sxconfig &&
./clean.sh &&
tar --use-compress-program bzip2 -xf strace-$VERSION.tar.bz2 &&
cd strace-$VERSION &&
chown -R root.root . &&
./configure \
    --prefix=/usr \
    --host=$SXARCH-$SXSYSNAME-linux &&
make
