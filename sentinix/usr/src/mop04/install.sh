#!/bin/sh

ldconfig
chown -R root.bin /bin
chown -R root.bin /sbin
chown -R root.bin /usr/bin
chown -R root.bin /usr/sbin
chown -R root.bin /usr/local/bin
chown -R root.bin /usr/local/sbin

chown root.slocate /usr/bin/slocate
chown root.tty /usr/bin/write
chown root.postdrop /usr/sbin/postdrop
chown root.postdrop /usr/sbin/postqueue

# gzip every manual under /usr/man that does not have a .gz suffix
( for dir in /usr/man/man{1,2,3,4,5,6,7,8,9}
do
    cd $dir
    for i in *; do
	if [ -f $i ]; then
	    if ! echo "$i" | grep -vq ".gz\$" ; then
		# if it doesn't end with .gz, gzip it...
		gzip -9 $i
	    fi
	fi
    done
done ) &&

# openssl has replaced the passwd(1) manpage, re-install it...

cd ../shadow &&
source sxconfig &&
cp shadow-$VERSION/man/passwd.1 /usr/man/man1/ &&
rm -f /usr/man/man1/passwd.1.gz &&
gzip /usr/man/man1/passwd.1 &&

# stop mysqld

sh /etc/rc.d/rc.mysqld stop
sleep 5
