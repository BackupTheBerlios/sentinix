#!/bin/sh

source sxconfig &&
cd gzip-$VERSION &&
make install &&
mv /usr/bin/gzip /bin &&
rm /usr/bin/{gunzip,zcat} &&
ln -s gzip /bin/gunzip &&
ln -s gzip /bin/zcat &&
ln -s gunzip /bin/uncompress
