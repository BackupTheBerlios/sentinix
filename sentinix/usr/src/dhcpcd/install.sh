#!/bin/sh
CWD=`pwd`

source sxconfig &&
cd dhcpcd-$VERSION &&
make install &&
cp dhcpcd.exe-sentinix /etc/dhcpc/dhcpcd.exe &&
rm -rf /usr/etc/dhcpc
