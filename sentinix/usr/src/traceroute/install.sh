#!/bin/sh
CWD=`pwd`

source sxconfig &&
cd traceroute-$VERSION &&
make install &&
cp traceroute.8 /usr/man/man8/
