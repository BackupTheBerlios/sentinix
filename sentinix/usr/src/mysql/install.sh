#!/bin/sh
CWD=`pwd`

source sxconfig &&
cd mysql-$VERSION &&
make install &&
( cd support-files &&
  cp my-huge.cnf my-large.cnf my-medium.cnf my-small.cnf /etc &&
  cp my-small.cnf /etc/my.cnf ) &&
( if [ ! -e /var/lib/mysql ]; then
	mkdir -p /var/lib/mysql
	chown mysql.mysql /var/lib/mysql
	chmod 750 /var/lib/mysql
fi ) &&
rm -rf /usr/mysql-test
