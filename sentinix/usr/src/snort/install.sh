#!/bin/sh
CWD=`pwd`

source ../sxarchconfig &&
source sxconfig &&
./clean.sh &&
tar -xzf snort-$SNORTVER.tar.gz &&
cd snort-$SNORTVER &&
chown -R root.root . &&
CFLAGS=-O2 ./configure \
    --prefix=/usr/components/snort \
    --host=$SXARCH-$SXSYSNAME-linux \
    --with-mysql &&
make &&
make install &&
( if [ ! -e /etc/snort ]; then
	mkdir /etc/snort
fi ) &&
( cd /etc; tar -xzf $CWD/snortrules.tgz ) &&
#
# acid
#
( if [ ! -d /usr/components/snort/acid ]; then
	mkdir -p /usr/components/snort/acid
fi ) &&
cd /usr/components/snort &&
tar -xzf $CWD/acid-0.9.6b23.tar.gz &&
#
# adodb
#
cd /usr/components/snort/acid &&
tar -xzf $CWD/adodb340.tgz &&
#
# jpgraph
#
cd /usr/components/snort/acid &&
tar -xzf $CWD/jpgraph-1.12.1.tar.gz &&
mv jpgraph-1.12.1 jpgraph &&
chown -R root.root . &&
find . -perm 777 -exec chmod 755 {} \; &&
find . -perm 775 -exec chmod 755 {} \; &&
find . -perm 666 -exec chmod 644 {} \; &&
find . -perm 664 -exec chmod 644 {} \; &&
find . -perm 444 -exec chmod 644 {} \; &&
#
# patch adodb and jpgraph paths into acid_conf.php
#
(
tmpf=`tempfile`
ac="/usr/components/snort/acid/acid_conf.php"

echo "Patching acid_conf.php..."

# adodb
#
sed 's%$DBlib_path = "";%$DBlib_path = "/usr/components/snort/acid/adodb";%g' $ac > $tmpf
cat $tmpf > $ac

# jpgraph
#
sed 's%$ChartLib_path = "";%$ChartLib_path = "/usr/components/snort/acid/jpgraph";%g' $ac > $tmpf
cat $tmpf > $ac

# alert_db
#
sed 's%$alert_dbname   = "snort_log";%$alert_dbname   = "snort";%g' $ac > $tmpf
cat $tmpf > $ac
sed 's%$alert_user     = "root";%$alert_user     = "snort";%g' $ac > $tmpf
cat $tmpf > $ac
sed 's%$alert_password = "mypassword";%$alert_password = "sentinix";%g' $ac > $tmpf
cat $tmpf > $ac

# archive_db
#
sed 's%$archive_user     = "root";%$archive_user     = "snort";%g' $ac > $tmpf
cat $tmpf > $ac
sed 's%$archive_password = "mypassword";%$archive_password = "sentinix";%g' $ac > $tmpf
cat $tmpf > $ac

rm -f $tmpname
) &&
( if [ ! -d /var/log/snort ]; then
	mkdir /var/log/snort
fi )
