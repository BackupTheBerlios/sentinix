#!/bin/sh
CWD=`pwd`

cd /usr/components &&
tar -xf $CWD/cgitoolkit_tarball.tar &&
cd $CWD &&
rm -f cgitoolkit_tarball.tar
