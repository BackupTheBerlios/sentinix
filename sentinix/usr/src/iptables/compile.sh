#!/bin/sh

source sxconfig &&
./clean.sh &&
tar --use-compress-program bzip2 -xf iptables-$VERSION.tar.bz2 &&
cd iptables-$VERSION &&
chown -R root.root . &&
make PREFIX=/usr
