#!/bin/sh
CWD=`pwd`

source sxconfig &&
cd samba-$VERSION &&
cd source &&
mkdir -p /usr/share/samba/codepages \
	/usr/share/swat \
	/var/spool/samba \
	/etc/samba/private \
	/var/cache/samba &&
chmod 0700 /etc/samba/private &&
make install &&
rmdir /usr/share/samba/codepages &&
cat $CWD/smb.conf-sample > /etc/samba/smb.conf-sample
