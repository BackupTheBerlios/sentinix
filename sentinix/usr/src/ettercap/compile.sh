#!/bin/sh

source ../sxarchconfig &&
source sxconfig &&
./clean.sh &&
tar -xzf ettercap-$VERSION.tar.gz &&
cd ettercap-$VERSION &&
chown -R root.root . &&
./configure \
    --prefix=/usr \
    --host=$SXARCH-$SXSYSNAME-linux \
    --enable-ncurses \
    --enable-plugins \
    --enable-https \
    --disable-gtk &&
make
