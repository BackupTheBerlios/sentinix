#!/bin/sh
CWD=`pwd`

source sxconfig &&
cd linux-$VERSION &&
cp -HR include/asm /usr/include &&
cp -R include/asm-generic /usr/include &&
cp -R include/linux /usr/include &&
touch /usr/include/linux/autoconf.h &&
# patch in openmosix and migshm
bzcat $CWD/openMosix-$VERSION-1.bz2 | patch -Np1
##cat $CWD/patch-Migshm-$VERSION.diff | patch -Np1
