#!/bin/sh
CWD=`pwd`

source sxconfig &&
./clean.sh &&
tar -xzvf procmail-$VERSION.tar.gz &&
cd procmail-$VERSION &&
chown -R root:root . &&
find . -perm 777 -exec chmod 755 {} \; &&
find . -perm 664 -exec chmod 644 {} \; &&
cp Makefile Makefile.orig &&
sed 's/LOCKINGTEST=__defaults__/LOCKINGTEST=.\/tmp ./g' Makefile.orig > Makefile &&
make &&
( cd src &&
  strip formail lockfile procmail ) &&
make install &&
make install-suid
