#!/bin/sh
#
# this inetd package was "borrowed" from Slackware 9.1.
#

CWD=`pwd`

source sxconfig &&
./clean.sh &&
tar -xzf inetd-OpenBSD-$VERSION.tar.gz &&
cd inetd &&
zcat $CWD/inetd-OpenBSD-$VERSION.diff.gz | patch -Np1 &&
zcat $CWD/inetd.loopingdos.diff.gz | patch -Np1 &&
make &&
strip inetd
