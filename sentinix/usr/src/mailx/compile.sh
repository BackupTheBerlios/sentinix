#!/bin/sh

#
# mailx has been replaced by nail
# mailx is still available as the "mailx" command
#

CWD=`pwd`

source sxconfig &&
./clean.sh &&
tar -xzvf mailx_$VERSION.orig.tar.gz &&
cd mailx-$VERSION.orig &&
zcat $CWD/mailx_$VERSION-10.diff.gz | patch -p1 &&
chown -R root.root . &&
make &&
strip mail
