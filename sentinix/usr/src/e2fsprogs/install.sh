#!/bin/sh
CWD=`pwd`

cd e2fsprogs-build &&
make install &&
make install-libs &&
install-info /usr/share/info/libext2fs.info /usr/share/info/dir
