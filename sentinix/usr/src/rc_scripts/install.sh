#!/bin/sh
# $Id: install.sh,v 1.2 2004/01/14 03:49:15 replikan Exp $
CWD=`pwd`

cd /etc &&
rm -rf rc.d &&
tar -xf $CWD/sentinix_rcd.tar &&
ln -s rc.6 /etc/rc.d/rc.0 &&
# fix permissions, others should not have any perms
chmod o= rc.d/* &&
cd $CWD &&
rm -f sentinix_rcd.tar
