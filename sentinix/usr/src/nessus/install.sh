#!/bin/sh
CWD=`pwd`

source ../sxarchconfig || exit 1
source sxconfig || exit 1

./clean.sh &&
tar -xzvf nessus-libraries-$VERSION.tar.gz &&
tar -xzvf libnasl-$VERSION.tar.gz &&
tar -xzvf nessus-core-$VERSION.tar.gz &&
tar -xzvf nessus-plugins-$VERSION.tar.gz &&
#
# compile nessus-libraries
#
( cd $CWD/nessus-libraries &&
  CFLAGS="$SXARCHFLAGS -fstack-protector" ./configure --prefix=/usr/components/nessus &&
  make &&
  installwatch -o $CWD/installwatch_1.log make install ) &&
#
# compile libnasl
#
( cd $CWD/libnasl &&
  CFLAGS="$SXARCHFLAGS -fstack-protector" ./configure --prefix=/usr/components/nessus &&
  make &&
  installwatch -o $CWD/installwatch_2.log make install ) &&
#
# compile nessus-core
#
( cd $CWD/nessus-core &&
  CFLAGS="$SXARCHFLAGS -fstack-protector" ./configure --prefix=/usr/components/nessus --disable-gtk &&
  make &&
  installwatch -o $CWD/installwatch_3.log make install ) &&
#
# compile nessus-plugins
#
( cd $CWD/nessus-plugins &&
  CFLAGS="$SXARCHFLAGS -fstack-protector" ./configure --prefix=/usr/components/nessus &&
  make &&
  installwatch -o $CWD/installwatch_4.log make install )
