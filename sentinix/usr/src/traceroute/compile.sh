#!/bin/sh
CWD=`pwd`

source ../sxarchconfig &&
source sxconfig &&
./clean.sh &&
tar -xzf traceroute-$VERSION.tar.gz &&
cd traceroute-$VERSION &&
zcat $CWD/traceroute_$VERSION-5.diff.gz | patch -Np1 &&
./configure \
    --prefix=/usr \
    --host=$SXARCH-$SXSYSNAME-linux &&
make &&
strip traceroute
