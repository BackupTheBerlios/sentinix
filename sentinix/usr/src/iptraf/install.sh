#!/bin/sh

source sxconfig &&
./clean.sh &&
tar -xzvf iptraf-$VERSION.tar.gz &&
cd iptraf-$VERSION &&
chown -R root.root . &&
cd src &&
make clean &&
make TARGET=/usr/bin &&
echo "n" | make TARGET=/usr/bin install &&
cd .. &&
cat Documentation/iptraf.8 > /usr/man/man8/iptraf.8 &&
cat Documentation/rvnamed.8 > /usr/man/man8/rvnamed.8
