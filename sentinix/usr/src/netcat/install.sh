#!/bin/sh
CWD=`pwd`

./clean.sh &&
mkdir netcat-build &&
cd netcat-build &&
tar -xzf $CWD/nc110.tgz &&
chown -R root.root . &&
zcat $CWD/nc-110-21.diff.gz | patch -p1 &&
zcat $CWD/nc.diff.gz | patch -p1 &&
make linux &&
strip nc &&
cp nc /usr/bin &&
cp debian/nc.1 /usr/man/man1/
