#!/bin/sh

source ../sxarchconfig &&
source sxconfig &&
./clean.sh &&
tar -xzf nfs-utils-$VERSION.tar.gz &&
cd nfs-utils-$VERSION &&
chown -R root.root . &&
CFLAGS="-O2 $SXARCHFLAGS -fstack-protector" ./configure \
    --prefix=/usr \
    --with-statedir=/var/lib/nfs \
    --host=$SXARCH-$SXSYSNAME-linux \
    --enable-nfsv3 \
    --enable-secure-statd &&
make &&
strip utils/exportfs/exportfs &&
strip utils/lockd/lockd &&
strip utils/mountd/mountd &&
strip utils/nfsd/nfsd &&
strip utils/nfsstat/nfsstat &&
strip utils/nhfsstone/nhfsstone &&
strip utils/showmount/showmount &&
strip utils/statd/statd
