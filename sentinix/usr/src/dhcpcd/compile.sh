#!/bin/sh
CWD=`pwd`

source ../sxarchconfig &&
source sxconfig &&
./clean.sh &&
tar -xzvf dhcpcd-$VERSION.tar.gz &&
cd dhcpcd-$VERSION &&
chown -R root.root . &&
find . -perm 777 -exec chmod 755 {} \; &&
find . -perm 555 -exec chmod 755 {} \; &&
find . -perm 444 -exec chmod 644 {} \; &&
# don't let "configure" apply a "-march" option.
zcat $CWD/dhcpcd.noarch+dhcpcd.exe.diff.gz | patch -Np1 &&
CFLAGS="-O2 $SXARCHFLAGS" ./configure \
	--prefix=/usr \
	--sysconfdir=/etc \
	--host=$SXARCH-$SXSYSNAME-linux &&
make clean &&
make &&
strip dhcpcd
