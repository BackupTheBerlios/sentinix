#!/bin/sh
CWD=`pwd`

source ../sxarchconfig &&
source sxconfig &&
./clean.sh &&
tar -xvzf gcc-everything-$VERSION.tar.gz &&
cd gcc-$VERSION &&
chown -R root.root . &&
patch -Np1 -i $CWD/gcc-2.95.3.patch &&
patch -Np1 -i $CWD/gcc-2.95.3-no-fixinc.patch &&
patch -Np1 -i $CWD/gcc-2.95.3-returntype-fix.patch &&
echo timestamp > gcc/cstamp-h.in &&
mkdir $CWD/gcc-build &&
cd $CWD/gcc-build &&
CFLAGS="-Wall -O2" LDFLAGS=-s \
    $CWD/gcc-$VERSION/configure \
	--prefix=/usr/gcc-$VERSION \
	--target=$SXARCH-$SXSYSNAME-linux \
	--host=$SXARCH-$SXSYSNAME-linux \
	--enable-shared \
	--enable-languages=c \
	--with-gnu-ld \
	--enable-threads=posix \
	--verbose &&
make bootstrap
