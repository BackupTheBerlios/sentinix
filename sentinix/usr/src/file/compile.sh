#!/bin/sh

source ../sxarchconfig &&
source sxconfig &&
./clean.sh &&
tar -xzf file-$VERSION.tar.gz &&
cd file-$VERSION &&
chown -R root.root . &&
./configure --prefix=/usr \
	--datadir=/usr/share/misc \
	--sysconfdir=/etc \
	--host=$SXARCH-$SXSYSNAME-linux &&
make
