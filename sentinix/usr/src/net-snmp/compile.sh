#!/bin/sh
CWD=`pwd`

source ../sxarchconfig &&
source sxconfig &&
./clean.sh &&
tar -xzf net-snmp-$VERSION.tar.gz &&
cd net-snmp-$VERSION &&
chown -R root.root . &&
./configure \
    --prefix=/usr \
    --host=$SXARCH-$SXSYSNAME-linux \
    --with-mib-modules="host smux" \
    --with-transports="UDP TCP Unix IPX" \
    --with-persistent-directory="/var/net-snmp" \
    --with-default-snmp-version=1 \
    --with-sys-contact="root@" \
    --with-sys-location="SENTINIX" \
    --with-logfile="/var/log/snmpd.log" \
    --with-perl-modules &&
make
