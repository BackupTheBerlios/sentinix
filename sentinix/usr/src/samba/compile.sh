#!/bin/sh
CWD=`pwd`

source ../sxarchconfig &&
source sxconfig &&
./clean.sh &&
tar -xzvf samba-$VERSION.tar.gz &&
cd samba-$VERSION &&
#zcat $CWD/samba.ssl.diff.gz | patch -p1 --verbose --backup --suffix=.orig &&
cd source &&
LIBS="-lssl -lcrypto" CFLAGS="$SXARCHFLAGS" ./configure \
	--prefix=/usr \
	--localstatedir=/var \
	--bindir=/usr/bin \
	--sbindir=/usr/sbin \
	--with-lockdir=/var/cache/samba \
	--sysconfdir=/etc \
	--with-configdir=/etc/samba \
	--with-privatedir=/etc/samba/private \
	--with-codepagedir=/etc/codepages \
	--with-sambabook=/usr/share/swat/using_samba \
	--with-swatdir=/usr/share/swat \
	--with-sslinc=/usr/include/openssl \
	--with-ssllib=/usr \
	--host=$SXARCH-$SXSYSNAME-linux \
	--with-fhs \
	--with-smbmount \
	--with-quotas \
	--with-syslog \
	--with-utmp \
	--with-ssl \
	--with-msdfs \
	--with-vfs &&
make
