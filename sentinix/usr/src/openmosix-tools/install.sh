#!/bin/sh
CWD=`pwd`

source ../sxarchconfig &&
source sxconfig &&
( if [ ! -d ../linux/linux-$LINUXVERSION ]; then
	echo "$CWD/../linux/linux-$LINUXVERSION does not exist"!
	echo "Enter /usr/src/linux run \"./install.sh\"."
	exit 1
fi ) &&
cd ../linux/linux-$LINUXVERSION &&
make mrproper &&
cp ../config.om .config &&
make oldconfig &&
make dep &&

cd $CWD &&
./clean.sh &&
tar --use-compress-program bzip2 -xvf openmosix-tools-$VERSION.tar.bz2 &&
cd openmosix-tools-$VERSION &&
chown -R root.root . &&
./configure \
    --prefix=/usr \
    --bindir=/bin \
    --sbindir=/sbin \
    --with-kerneldir=/usr/src/linux/linux-$LINUXVERSION \
    --host=$SXARCH-$SXSYSNAME-linux &&
make &&
make install
