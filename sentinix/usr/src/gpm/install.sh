#!/bin/sh
CWD=`pwd`

source ../sxarchconfig &&
source sxconfig &&
./clean.sh &&
tar -xzf gpm-$VERSION.tar.gz &&
cd gpm-$VERSION &&
chown -R root.root . &&
cat $CWD/gpm-$VERSION-segfault.patch | patch -Np1 &&
./configure \
    --prefix=/usr \
    --host=$SXARCH-$SXSYSNAME-linux &&
make &&
make install
