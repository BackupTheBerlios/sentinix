#!/bin/sh
CWD=`pwd`

source ../sxarchconfig &&
source sxconfig &&
./clean.sh &&
tar -xzf jpegsrc.v$VERSION.tar.gz &&
cd jpeg-$VERSION &&
zcat $CWD/jpeg-$VERSION.diff.gz | patch -p0 -E &&
./configure \
    --prefix=/usr \
    --host=$SXARCH-$SXSYSNAME-linux \
    --enable-shared \
    --enable-static &&
make
