#!/bin/sh
CWD=`pwd`

source sxconfig &&
./clean.sh &&
tar -xzf makedev_${VERSION}.orig.tar.gz &&
cd makedev-${VERSION}.orig &&
chown -R root.root . &&

zcat ../makedev_2.3.1-58.diff.gz | patch -Np1

