#!/bin/sh
CWD=`pwd`

source ../sxarchconfig &&
source sxconfig &&
./clean.sh &&
tar -xzf rcs-$VERSION.tar.gz &&
cd rcs-$VERSION &&
chown -R root.root . &&
cat $CWD/rcs-$VERSION.diff | patch -Np1 &&
./configure \
    --prefix=/usr \
    --host=$SXARCH-$SXSYSNAME-linux &&
make CFLAGS="-O2" LDFLAGS="-s" &&
make install
