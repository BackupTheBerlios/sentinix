#!/bin/sh

source ../sxarchconfig &&
source sxconfig &&
./clean.sh &&
tar -xzf libpcap-$PCAPVER.tar.gz &&
cd libpcap-$PCAPVER &&
chown -R root.root . &&
./configure \
    --prefix=/usr \
    --host=$SXARCH-$SXSYSNAME-linux \
    --enable-ipv6 &&
make
