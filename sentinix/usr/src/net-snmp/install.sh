#!/bin/sh
CWD=`pwd`

source sxconfig &&
cd net-snmp-$VERSION &&
make install &&
cp $CWD/snmpd.conf /usr/share/snmp/
