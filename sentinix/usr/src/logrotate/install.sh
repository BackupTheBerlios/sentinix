#!/bin/sh
CWD=`pwd`

source sxconfig &&
cd logrotate-$VERSION &&
cp logrotate /usr/sbin/ &&
cat logrotate.8 | gzip -9c > /usr/man/man8/logrotate.8.gz
