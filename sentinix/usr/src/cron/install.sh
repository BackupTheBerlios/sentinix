#!/bin/sh

source sxconfig &&
cd dcron-$VERSION &&
cp crond /usr/sbin/ &&
cp crontab /usr/bin/ &&
cat crontab.1 | gzip -9c > /usr/man/man1/crontab.1.gz &&
cat crond.8 | gzip -9c > /usr/man/man8/crond.8.gz
