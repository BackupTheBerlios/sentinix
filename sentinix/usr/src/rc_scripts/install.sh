#!/bin/sh
# $Id: install.sh,v 1.10 2004/01/18 06:18:35 replikan Exp $
CWD=`pwd`

cd /etc &&
rm -rf rc.d &&
tar -xf $CWD/sentinix_rcd.tar &&
ln -s rc.6 /etc/rc.d/rc.0 &&
# fix permissions, others should not have any perms
chmod o= rc.d/* &&
cd $CWD &&
rm -f sentinix_rcd.tar &&
make -C scripts install
