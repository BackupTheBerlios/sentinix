#!/bin/sh
CWD=`pwd`

source sxconfig &&
cd unzip-${UNZIPVER} &&
make prefix=/usr install &&

cd $CWD/zip-${ZIPVER} &&
make prefix=/usr install
