#!/bin/sh

CWD=`pwd`

#
# db2
#

./clean.sh &&
tar -xzf db2-glibc-2.1.3.tar.gz &&
cd db2 &&
zcat $CWD/db2-glibc-2.1.3.patch.gz | patch -Np1 -E --suffix=.orig --backup &&
zcat $CWD/db2-2.4.14-db2.patch.gz | patch -Np1 -E --suffix=.orig --backup &&
zcat $CWD/db2.cflags.diff.gz | patch -Np1 -E --suffix=.orig --backup &&

make &&
strip libdb2.so.3 db_archive db_checkpoint db_deadlock db_dump db_load db_printlog db_recover db_stat

