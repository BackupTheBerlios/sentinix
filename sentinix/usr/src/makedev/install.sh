#!/bin/sh
CWD=`pwd`

source sxconfig &&
./clean.sh &&
tar -xzf makedev_${VERSION}.orig.tar.gz &&
cd makedev-${VERSION}.orig &&
chown -R root.root . &&

zcat ../makedev_2.3.1-58.diff.gz | patch -Np1 &&

# we don't copy the manpage since it's out of date after the patch is applied.

cp MAKEDEV /dev &&
chmod 0754 /dev/MAKEDEV &&
chown root.root /dev/MAKEDEV
