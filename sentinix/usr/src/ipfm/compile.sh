#!/bin/sh

source ../sxarchconfig &&
source sxconfig &&
./clean.sh &&
tar -xzvf ipfm-$VERSION.tgz &&
cd ipfm-$VERSION &&
chown -R root.root . &&
./configure \
    --prefix=/usr \
    --sysconfdir=/etc \
    --localstatedir=/var \
    --host=$SXARCH-$SXSYSNAME-linux &&
make
