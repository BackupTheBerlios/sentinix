#!/bin/sh

source sxconfig &&
cd iptraf-$VERSION &&
cd src &&
echo "n" | make TARGET=/usr/bin install &&
cd .. &&
cat Documentation/iptraf.8 > /usr/man/man8/iptraf.8 &&
cat Documentation/rvnamed.8 > /usr/man/man8/rvnamed.8
