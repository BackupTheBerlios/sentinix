#!/bin/sh
CWD=`pwd`

source ../sxarchconfig &&
source sxconfig &&
./clean.sh &&
# install rrdtool
tar -xzf rrdtool-$VERSION.tar.gz &&
cd rrdtool-$VERSION &&
chown -R root.root . &&
./configure \
    --prefix=/usr/components/rrdtool \
    --host=$SXARCH-$SXSYSNAME-linux &&
make
