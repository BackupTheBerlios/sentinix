#!/bin/sh
CWD=`pwd`
PKG=/.

source sxconfig &&
cd coreutils-$VERSION &&
make install &&
# remove hostname, kill, su and uptime ; all provided by other packages
( for i in hostname kill su uptime ; do
    rm -f $PKG/usr/{bin,sbin}/$i $PKG/usr/man/man?/$i
done ) &&
# make some symlinks
ln -sf ../../bin/install /usr/bin/ &&
ln -sf test /bin/[ &&
ln -sf /bin/id /usr/bin/ &&
ln -sf /bin/printf /usr/bin/
