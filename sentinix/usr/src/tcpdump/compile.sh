#!/bin/sh

source ../sxarchconfig &&
source sxconfig &&
./clean.sh &&
tar -xzf tcpdump-$TCPDUMPVER.tar.gz &&
cd tcpdump-$TCPDUMPVER &&
chown -R root.root . &&
./configure \
    --prefix=/usr \
    --host=$SXARCH-$SXSYSNAME-linux \
    --enable-ipv6 &&
make
