#!/bin/sh
# $Id: install.sh,v 1.1 2004/01/11 20:10:20 replikan Exp $
CWD=`pwd`

tar --exclude CVS -cf sentinix_rcd.$$.tar rc.d &&
cd /etc/ || exit 1
if [ -d rc.d ]; then
    rm -rf rc.d
fi
tar -xf $CWD/sentinix_rcd.$$.tar &&
# fix permissions, others should not have any perms
chmod o= rc.d/* &&
cd $CWD &&
rm -f sentinix_rcd.$$.tar
