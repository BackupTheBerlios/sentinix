#!/bin/sh

CWD=`pwd`

#
# db1
#

cd db.1.85 &&
cd PORT/linux &&
(
    cat libdb1.so.2.1.3 > /lib/libdb1.so.2.1.3
    chmod 755 /lib/libdb1.so.2.1.3
    cat db_dump185 > /usr/bin/db1_dump185
    chmod 755 /usr/bin/db1_dump185
    chown 0.0 /usr/bin/db1_dump185
    cat libdb.a > /usr/lib/libdb1.a
    mkdir -p /usr/include/db1
    cat include/db.h > /usr/include/db1/db.h
    cat include/mpool.h > /usr/include/db1/mpool.h
    cat include/ndbm.h > /usr/include/db1/ndbm.h
)
