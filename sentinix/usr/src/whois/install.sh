#!/bin/sh
CWD=`pwd`

#
# whois is installed in the tcpip package, fix it!  (remove this one or that one from tcpip)
#

source sxconfig &&
cd whois-$VERSION &&
make prefix=/usr install
