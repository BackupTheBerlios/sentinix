#!/bin/sh
CWD=`pwd`

source sxconfig &&
cd bind-$VERSION &&
cp contrib/named-bootconf/named-bootconf.sh /usr/sbin/ &&
make install &&
cd $CWD &&
./conf-install
