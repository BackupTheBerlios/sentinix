#!/bin/sh
CWD=`pwd`

source sxconfig &&
./clean.sh &&
tar xzvf $CWD/logrotate-$VERSION.tar.gz &&
cd logrotate-$VERSION &&
chown -R root.root . &&
zcat $CWD/logrotate.slackware.diff.gz | patch -p1 &&
make clean &&
make &&
strip logrotate
