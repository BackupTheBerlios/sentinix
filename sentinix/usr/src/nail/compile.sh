#!/bin/sh

source ../sxarchconfig &&
source sxconfig &&
./clean.sh &&
tar -xzf nail-$VERSION.tar.gz &&
cd nail-$VERSION &&
chown -R root.root . &&
./configure \
    --prefix=/usr \
    --host=$SXARCH-$SXSYSNAME-linux \
    --with-openssl \
    --with-sendmail=/usr/sbin/sendmail &&
make
