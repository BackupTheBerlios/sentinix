#!/bin/sh
CWD=`pwd`

#
# whois is installed in the tcpip package, fix it!  (remove this one or that one from tcpip)
#

source sxconfig &&
./clean.sh &&
tar -xzf whois_$VERSION.tar.gz &&
cd whois-$VERSION &&
chown -R root.root . &&
make prefix=/usr
