#!/bin/sh

CWD=`pwd`

#
# db1
#

./clean.sh &&
tar -xzf $CWD/db1/db.1.85.tar.gz &&
cd db.1.85 &&

zcat $CWD/db.1.85.glibc.diff.gz | patch -p1 -E &&
zcat $CWD/db.1.85.cflags.diff.gz | patch -p1 -E &&

cd PORT/linux &&
make &&
strip libdb1.so.2.1.3 db_dump185
