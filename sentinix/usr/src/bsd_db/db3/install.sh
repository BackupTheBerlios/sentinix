#!/bin/sh
CWD=`pwd`

#
# db3
#

source ../../sxarchconfig || exit 1

cd db-3.1.17 &&
cd dist &&

zcat $CWD/db3/db-3.1.17.la.diff.gz | patch -Np0 &&
cat libdb-3.1.la > /usr/lib/libdb-3.1.la &&
cd .libs &&

strip berkeley_db_svc db_archive db_checkpoint db_deadlock db_dump \
	db_load db_printlog db_recover db_stat db_upgrade db_verify libdb-3.1.so &&
cat berkeley_db_svc > /usr/bin/berkeley_db_svc &&
cat db_archive > /usr/bin/db_archive &&
cat db_checkpoint > /usr/bin/db_checkpoint &&
cat db_deadlock > /usr/bin/db_deadlock &&
cat db_dump > /usr/bin/db_dump &&
cat db_load > /usr/bin/db_load &&
cat db_printlog > /usr/bin/db_printlog &&
cat db_recover > /usr/bin/db_recover &&
cat db_stat > /usr/bin/db_stat &&
cat db_upgrade > /usr/bin/db_upgrade &&
cat db_verify > /usr/bin/db_verify &&

chmod 755 /usr/bin/berkeley_db_svc /usr/bin/db_archive /usr/bin/db_checkpoint /usr/bin/db_deadlock /usr/bin/db_dump /usr/bin/db_load /usr/bin/db_printlog /usr/bin/db_recover /usr/bin/db_stat /usr/bin/db_upgrade /usr/bin/db_verify &&
chown 0:0 /usr/bin/berkeley_db_svc /usr/bin/db_archive /usr/bin/db_checkpoint /usr/bin/db_deadlock /usr/bin/db_dump /usr/bin/db_load /usr/bin/db_printlog /usr/bin/db_recover /usr/bin/db_stat /usr/bin/db_upgrade /usr/bin/db_verify &&

cat libdb-3.1.so > /lib/libdb-3.1.so &&
chmod 755 /lib/libdb-3.1.so &&

cd .. &&

mkdir -p /usr/include/db3 &&
cat db.h > /usr/include/db3/db.h &&
cd ../include &&
cat db_185.h > /usr/include/db3/db_185.h &&
cat db_cxx.h > /usr/include/db3/db_cxx.h &&

cd / &&

( cd lib ; rm -rf libdb.so.2 ) &&
( cd lib ; ln -sf libdb1.so.2.1.3 libdb.so.2 ) &&
( cd lib ; rm -rf libdb.so.3 ) &&
( cd lib ; ln -sf libdb2.so.3 libdb.so.3 ) &&

( cd lib ; rm -rf libdb1.so.2 ) &&
( cd lib ; ln -sf libdb1.so.2.1.3 libdb1.so.2 ) &&

( cd lib ; rm -rf libdb.so ) &&
( cd lib ; ln -sf libdb-3.1.so libdb.so ) &&
( cd usr/lib ; rm -rf libdb1.so ) &&
( cd usr/lib ; ln -sf ../../lib/libdb1.so.2 libdb1.so ) &&
( cd usr/lib ; rm -rf libdb2.so ) &&
( cd usr/lib ; ln -sf ../../lib/libdb2.so.3 libdb2.so ) &&
# This NDBM stuff breaks things
#( cd usr/lib ; rm -rf libndbm.so )
#( cd usr/lib ; ln -sf ../../lib/libdb2.so.3 libndbm.so )
( cd lib ; rm -rf libdb.so ) &&
( cd lib ; ln -sf libdb-3.1.so libdb.so ) &&
#if [ -e usr/lib/libdb2.a ]; then
#  ( cd usr/lib ; rm -rf libndbm.a )
#  ( cd usr/lib ; ln -sf libdb2.a libndbm.a )
#fi

(
    if [ -e usr/include/db3/db.h ]; then
      ( cd usr/include ; rm -rf db.h )
      ( cd usr/include ; ln -sf db3/db.h db.h )
    fi
    if [ -e usr/lib/libdb-3.1.a ]; then
      ( cd usr/lib ; rm -rf libdb.a )
      ( cd usr/lib ; ln -sf libdb-3.1.a libdb.a )
    fi
)
