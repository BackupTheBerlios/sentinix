#!/bin/sh
CWD=`pwd`

source sxconfig &&
cd binutils-build &&
make install &&
#
# have binutils link against libs in /lib and /usr/lib instead of /static/lib.
#
make -C ld clean &&
make -C ld LIB_PATH=/usr/lib:/lib &&
make -C ld INSTALL=/static/bin/install install &&
# tell GCC to link against the new ld under /lib instead of under /static/lib.
SPECFILE=/static/lib/gcc-lib/*/*/specs &&
sed -e 's@ /static/lib/ld-linux.so.2@ /lib/ld-linux.so.2@g' $SPECFILE > tempspecfile.$$ &&
mv -f tempspecfile.$$ $SPECFILE &&
unset SPECFILE
