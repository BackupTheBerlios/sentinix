#!/bin/sh
CWD=`pwd`

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
  ./configure --prefix=/usr/components/nessus &&
  make &&
  make install ) &&
#
# compile libnasl
#
( cd $CWD/libnasl &&
  ./configure --prefix=/usr/components/nessus &&
  make &&
  make install ) &&
#
# compile nessus-core
#
( cd $CWD/nessus-core &&
  ./configure --prefix=/usr/components/nessus &&
  make &&
  make install ) &&
#
# compile nessus-plugins
#
( cd $CWD/nessus-plugins &&
  ./configure --prefix=/usr/components/nessus &&
  make &&
  make install )
