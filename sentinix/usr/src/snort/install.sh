#!/bin/sh
CWD=`pwd`

source ../sxarchconfig &&
source sxconfig &&
./clean.sh &&
tar -xzf snort-$VERSION.tar.gz &&
cd snort-$VERSION &&
chown -R root.root . &&
CFLAGS=-O2 ./configure \
    --prefix=/usr/components/snort \
    --host=$SXARCH-$SXSYSNAME-linux \
    --with-mysql &&
make &&

installwatch -o $CWD/installwatch.log $CWD/function_install.sh $CWD &&

cd /usr/components/snort/acid &&
chown -R root.root . &&
find . -perm 777 -exec chmod 755 {} \; &&
find . -perm 775 -exec chmod 755 {} \; &&
find . -perm 666 -exec chmod 644 {} \; &&
find . -perm 664 -exec chmod 644 {} \; &&
find . -perm 444 -exec chmod 644 {} \; &&

(
#
# patch adodb and jpgraph paths into acid_conf.php
#
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
)
