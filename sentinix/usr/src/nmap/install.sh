#!/bin/sh
CWD=`pwd`

source ../sxarchconfig &&
source sxconfig &&
./clean.sh &&
tar --use-compress-program bzip2 -xvf nmap-$VERSION.tar.bz2 &&
cd nmap-$VERSION &&
cat $CWD/nmap-3.48-cflags.patch | patch -Np1 &&
chown -R root:root . &&
CFLAGS="-O2 $SXARCHFLAGS" ./configure \
	--prefix=/usr \
	--host=$SXARCH-$SXSYSNAME-linux \
	--without-nmapfe \
	--without-openssl &&
make &&
make install
