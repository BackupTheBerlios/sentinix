#!/bin/sh

source sxconfig &&
./clean.sh &&
tar -xzf kbd-$VERSION.tar.gz &&
cd kbd-$VERSION &&
./configure \
    --prefix=/usr \
    --datadir=/share/kbd \
    --mandir=/man &&
make
