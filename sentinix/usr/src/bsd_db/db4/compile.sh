#!/bin/sh

#
# db 4.1 is fortunately pretty straigt forward to install :)
#

source ../../sxarchconfig &&
source sxconfig &&
./clean.sh &&
tar -xzf db-$VERSION.tar.gz &&
cd db-$VERSION &&
chown -R root.root . &&
cd build_unix &&
../dist/configure \
    --prefix=/usr \
    --host=$SXARCH-$SXSYSNAME-linux \
    --enable-compat185 \
    --enable-cxx \
    --enable-rpc &&
make
