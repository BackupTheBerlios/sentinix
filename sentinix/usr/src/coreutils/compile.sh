#!/bin/sh
CWD=`pwd`
PKG=/.

source ../sxarchconfig &&
source sxconfig &&
./clean.sh &&
tar -xzf coreutils-$VERSION.tar.gz &&
cd coreutils-$VERSION &&
chown -R root.root . &&
CFLAGS="-O2 $SXARCHFLAGS" ./configure \
    --prefix=/usr \
    --host=$SXARCH-$SXSYSNAME-linux \
    --target=$SXARCH-$SXSYSNAME-linux \
    --bindir=/bin \
    --sbindir=/sbin \
    --sysconfdir=/etc \
    --localstatedir=/var \
    --libdir=/lib \
    --with-gnu-ld &&
make
