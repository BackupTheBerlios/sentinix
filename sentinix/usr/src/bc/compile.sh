#!/bin/sh
CWD=`pwd`

source ../sxarchconfig &&
source sxconfig &&
./clean.sh &&
tar -xzvf bc-$VERSION.tar.gz &&
cd bc-$VERSION &&
chown -R root:root . &&
bzcat $CWD/bc-1.06-readline+flex.diff.bz2 | patch -Np1 &&
CFLAGS="-O2 $SXARCHFLAGS" ./configure \
    --prefix=/usr \
    --host=$SXARCH-$SXSYSNAME-linux \
    --with-readline &&
make &&
strip bc/bc dc/dc
