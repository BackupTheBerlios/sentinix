#!/bin/sh
CWD=`pwd`

source sxconfig &&
cd glibc-build &&
make install &&
make localedata/install-locales &&
# install the linuxthreads man pages
make -C $CWD/glibc-$VERSION/linuxthreads/man install
