#!/bin/sh
CWD=`pwd`

source sxconfig &&
cd $CWD/tcpdump-$VERSION &&
make install &&
cd $CWD/tcpdump2ascii-* &&
cp tcpdump2ascii /usr/bin/ &&
chown root:bin /usr/bin/tcpdump2ascii &&
chmod 0755 /usr/bin/tcpdump2ascii &&
cd $CWD &&
zcat chaosreader.gz > /usr/bin/chaosreader &&
chown root:bin /usr/bin/chaosreader &&
chmod 0755 /usr/bin/chaosreader
