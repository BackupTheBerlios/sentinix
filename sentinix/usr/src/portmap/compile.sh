#!/bin/sh
CWD=`pwd`

source ../sxarchconfig &&
source sxconfig &&
./clean.sh &&
tar xzvf $CWD/portmap_$VERSION.tar.gz &&
mv portmap_${VERSION}beta portmap_$VERSION &&
cd portmap_$VERSION &&
chown -R root.root . &&
zcat $CWD/portmap_5-2.1.diff.gz | patch -p1 --backup --suffix=.orig &&
patch -p1 -i $CWD/portmap_stack-protector.patch &&
make NSARCHS="$SXARCHFLAGS" &&
strip portmap pmap_dump pmap_set
