#!/bin/sh

source sxconfig &&
./clean.sh &&
tar -xzvf iptraf-$VERSION.tar.gz &&
cd iptraf-$VERSION &&
chown -R root.root . &&
cd src &&
make clean &&
make TARGET=/usr/bin
