#!/bin/sh
CWD=`pwd`

cd /usr/components &&
installwatch -o $CWD/installwatch.log tar -xzf $CWD/sentinix-snortcenter.tar.gz &&
cd $CWD &&
mysql -u root < snortcenter.sql
