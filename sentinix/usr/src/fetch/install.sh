#!/bin/sh
CWD=`pwd`

#
# first we build http_fetcher...
#

source ../sxarchconfig &&
source sxconfig &&
./clean.sh &&
tar -xzf http_fetcher-$HTTPFETCHERV.tar.gz &&
cd http_fetcher-$HTTPFETCHERV &&
chown -R root.root . &&
CFLAGS="-O2 $SXARCHFLAGS" \
LDFLAGS=-s \
./configure \
    --prefix=/usr \
    --sysconfdir=/etc \
    --host=$SXARCH-$SXSYSNAME-linux &&
make &&
make install &&
#
# then we build "fetch"...
#
cd $CWD &&
tar -xzf fetch-$FETCHVER.tar.gz &&
cd fetch-$FETCHVER &&
chown -R root.root . &&
CFLAGS="-O2 $SXARCHFLAGS" \
LDFLAGS=-s \
./configure \
    --prefix=/usr \
    --sysconfdir=/etc \
    --host=$SXARCH-$SXSYSNAME-linux &&
make &&
make install
