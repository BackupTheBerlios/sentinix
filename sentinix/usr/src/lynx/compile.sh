#!/bin/sh
CWD=`pwd`

source ../sxarchconfig &&
source sxconfig &&
./clean.sh &&
tar -xzf lynx${VERSION}.tar.gz &&
cd lynx${UNTARVER} &&
chown -R root.root . &&
CFLAGS="-O2 $SXARCHFLAGS -fstack-protector" ./configure \
    --prefix=/usr \
    --libdir=/usr/lib/lynx \
    --sysconfdir=/etc \
    --host=$SXARCH-$SXSYSNAME-linux \
    --enable-default-colors \
    --with-screen=ncurses \
    --enable-gzip-help \
    --with-zlib \
    --enable-read-eta \
    --enable-scrollbar \
    --with-ssl \
    --enable-color-style \
    --enable-prettysrc \
    --enable-source-cache \
    --enable-nsl-fork &&
make
