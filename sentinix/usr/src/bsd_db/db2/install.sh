#!/bin/sh

CWD=`pwd`

#
# db2
#

cd db2 &&
(
cat libdb2.so.3 > /lib/libdb2.so.3
chmod 755 /lib/libdb2.so.3
cat libdb2.a > /usr/lib/libdb2.a
cat db_archive > /usr/bin/db2_archive 
cat db_checkpoint > /usr/bin/db2_checkpoint 
cat db_deadlock > /usr/bin/db2_deadlock 
cat db_dump > /usr/bin/db2_dump 
cat db_load > /usr/bin/db2_load 
cat db_printlog > /usr/bin/db2_printlog 
cat db_recover > /usr/bin/db2_recover 
cat db_stat > /usr/bin/db2_stat

chmod 755 /usr/bin/db2_archive /usr/bin/db2_checkpoint /usr/bin/db2_deadlock /usr/bin/db2_dump /usr/bin/db2_load /usr/bin/db2_printlog /usr/bin/db2_recover /usr/bin/db2_stat
chown 0:0 /usr/bin/db2_archive /usr/bin/db2_checkpoint /usr/bin/db2_deadlock /usr/bin/db2_dump /usr/bin/db2_load /usr/bin/db2_printlog /usr/bin/db2_recover /usr/bin/db2_stat

mkdir -p /usr/include/db2
cat db.h > /usr/include/db2/db.h
cat db_185.h > /usr/include/db2/db_185.h
)
