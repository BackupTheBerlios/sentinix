#!/bin/sh

source ../sxarchconfig &&
source sxconfig &&
./clean.sh &&
tar -xzf autoconf-$VERSION.tar.gz &&
cd autoconf-$VERSION &&
chown -R root.root . &&
./configure \
    --prefix=/usr \
    --host=$SXARCH-$SXSYSNAME-linux &&
make
