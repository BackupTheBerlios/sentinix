#!/bin/sh

source ../sxarchconfig &&
source sxconfig &&
./clean.sh &&
tar -xzf gcal-$VERSION.tar.gz &&
cd gcal-$VERSION &&
chown -R root.root . &&
./configure \
    --prefix=/usr \
    --host=$SXARCH-$SXSYSNAME-linux &&
make &&
strip src/gcal src/gcal2txt src/tcal src/txt2gcal &&
make install
