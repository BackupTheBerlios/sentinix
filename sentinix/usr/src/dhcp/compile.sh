#!/bin/sh
CWD=`pwd`

source ../sxarchconfig &&
source sxconfig &&
./clean.sh &&
tar -xzvf dhcp-$VERSION.tar.gz &&
cd dhcp-$VERSION &&
chown -R root.root . &&
./configure linux-2.2 &&
make DEBUG="-O2 $SXARCHFLAGS"
