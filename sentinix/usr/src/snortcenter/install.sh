#!/bin/sh
CWD=`pwd`

cd /usr/components &&
tar -xzf $CWD/sentinix-snortcenter.tar.gz &&
cd $CWD &&
mysql -u root < snortcenter.sql
