#!/bin/sh

source ../sxarchconfig &&
source sxconfig &&
./clean.sh &&
tar -xzf qstat$VERSION.tar.gz &&
cd qstat$VERSION &&
chown -R root.root . &&
make CFLAGS="-O2 $SXARCHFLAGS" LDFLAGS=-s SYSCONFDIR=/etc &&
mkdir -p /usr/share/qstat &&
mkdir -p /usr/share/doc/qstat &&
cp qstat /usr/bin/ &&
cp template/* /usr/share/qstat/ &&
cp info/* /usr/share/doc/qstat/ &&
cp qstatdoc.html /usr/share/doc/qstat/ &&
cp qstat.cfg /usr/share/qstat/ &&
cp qstat.cfg /etc/sample-qstat.cfg
