#!/bin/sh
CWD=`pwd`

source sxconfig &&
./clean.sh &&
tar xzvf $CWD/dcron-$VERSION.tar.gz &&
cd dcron-$VERSION &&
chown -R root.root . &&
zcat $CWD/dcron-$VERSION.diff.gz | patch -p1 -E --verbose --backup &&
# Added signal handling/logging patch from TEMHOTA <temnota@kmv.ru>:
zcat $CWD/dcron-$VERSION.diff2.gz | patch -p1 -E --verbose --backup &&
# Use /usr/sbin/sendmail, not /usr/lib/sendmail.  Fixes cron working
# with Postfix.  Suggested by Big Brother.
zcat $CWD/dcron-$VERSION.diff3.gz | patch -p1 -E --verbose --backup &&
# Fix problem where user creates /var/spool/cron/crontabs/<user>.new 
# using 'crontab -', exits with control-c, and then crontab refuses to
# overwrite the junk file:
zcat $CWD/dcron-$VERSION.crontab.diff4.gz | patch -p1 -E --verbose --backup &&
# Dcron reports wrong version:
zcat $CWD/dcron-2.3.3.version.diff.gz | patch -p1 &&
make &&
strip crond crontab
