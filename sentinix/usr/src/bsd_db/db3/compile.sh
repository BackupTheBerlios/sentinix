#!/bin/sh
CWD=`pwd`

#
# db3
#

source ../../sxarchconfig || exit 1

./clean.sh &&
tar -xzf $CWD/db-3.1.17.tar.gz &&
cd db-3.1.17 &&

zcat $CWD/db-3.1.17.mutex.diff.gz | patch -Np1 -E --suffix=.orig --backup &&
cd dist &&
make clean &&
CFLAGS="-O2 $SXARCHFLAGS" ./configure \
    --prefix="" \
    --host=$SXARCH-$SXSYSNAME-linux \
    --enable-compat185 \
    --enable-shared \
    --enable-rpc &&
make
