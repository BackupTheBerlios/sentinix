#!/bin/sh
CWD=`pwd`

source ../sxarchconfig &&
source sxconfig &&
./clean.sh &&
tar -xzvf mc-$VERSION.tar.gz &&
cd mc-$VERSION &&
chown -R root.root . &&
CFLAGS="-O2 $SXARCHFLAGS" ./configure \
	--prefix=/usr \
	--sysconfdir=/etc \
	--localstatedir=/var \
	--host=$SXARCH-$SXSYSNAME-linux \
	--enable-charset \
	--enable-largefile \
	--with-gpm-mouse \
	--with-included-slang \
	--with-x=no \
	--with-vfs \
	--with-ext2undel \
	--without-debug \
	--with-screen=mcslang &&
make &&
make install
