#!/bin/sh
CWD=`pwd`

./clean.sh &&
source sxconfig &&
tar -xzf unzip550.tar.gz &&
cd unzip-${UNZIPVER} &&
chown -R root.root . &&
cp unix/Makefile . &&
make linux &&

cd $CWD &&
tar -xzf zip23.tar.gz &&
cd zip-${ZIPVER} &&
chown -R root.root . &&
cp unix/Makefile . &&
make generic
