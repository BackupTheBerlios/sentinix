#!/bin/sh
CWD=`pwd`

source sxconfig &&
cd portmap_$VERSION &&
cat portmap > /sbin/rpc.portmap &&
chmod 755 /sbin/rpc.portmap &&
cat pmap_dump > /usr/sbin/pmap_dump &&
chmod 755 /usr/sbin/pmap_dump &&
cat pmap_set > /usr/sbin/pmap_set &&
chmod 755 /usr/sbin/pmap_dump &&
cat $CWD/portmap.8.gz > /usr/man/man8/portmap.8.gz
