#!/bin/sh
CWD=`pwd`

source ../sxarchconfig &&
source sxconfig &&
./clean.sh &&
tar -xzf libnet-$VERSION.tar.gz &&
cd Libnet-$VERSION &&
patch -Np1 -i $CWD/libnet-gcc3.3.diff &&
chown -R root.root . &&
CFLAGS="$SXARCHFLAGS" ./configure \
    --prefix=/usr \
    --host=$SXARCH-$SXSYSNAME-linux &&
make
