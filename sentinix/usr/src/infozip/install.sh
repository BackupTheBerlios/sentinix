#!/bin/sh
CWD=`pwd`

./clean.sh &&
tar -xzf unzip550.tar.gz &&
cd unzip-5.50 &&
chown -R root.root . &&
cp unix/Makefile . &&
make linux &&
make prefix=/usr install &&

cd $CWD &&
tar -xzf zip23.tar.gz &&
cd zip-2.3 &&
chown -R root.root . &&
cp unix/Makefile . &&
make generic &&
make prefix=/usr install
