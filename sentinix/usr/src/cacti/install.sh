#!/bin/sh
CWD=`pwd`

source ../sxarchconfig &&
source sxconfig &&
./clean.sh &&
# install cacti
tar -xzf cacti-$VERSION.tar.gz &&
cd cacti-$VERSION &&
chown -R root.root . &&
cd $CWD &&
# patch cacti.sql, in order to set some SENTINIX defaults (obsolete if using "sentinix_cacti.sql").
cat cacti-$VERSION/cacti.sql | sed "s%^INSERT INTO settings VALUES ('path_webcacti','<DEFAULT>');%INSERT INTO settings VALUES ('path_webcacti','/cacti');%" > /tmp/cacti.$$ &&
mv /tmp/cacti.$$ cacti-$VERSION/cacti.sql &&
cat cacti-$VERSION/cacti.sql | sed "s%^INSERT INTO settings VALUES ('path_webroot','<DEFAULT>');%INSERT INTO settings VALUES ('path_webroot','/usr/components');%" > /tmp/cacti.$$ &&
mv /tmp/cacti.$$ cacti-$VERSION/cacti.sql &&
cat cacti-$VERSION/cacti.sql | sed "s%^INSERT INTO settings VALUES ('path_snmpwalk','<DEFAULT>');%INSERT INTO settings VALUES ('path_snmpwalk','/usr/bin/snmpwalk');%" > /tmp/cacti.$$ &&
mv /tmp/cacti.$$ cacti-$VERSION/cacti.sql &&
cat cacti-$VERSION/cacti.sql | sed "s%^INSERT INTO settings VALUES ('path_snmpget','<DEFAULT>');%INSERT INTO settings VALUES ('path_snmpget','/usr/bin/snmpget');%" > /tmp/cacti.$$ &&
mv /tmp/cacti.$$ cacti-$VERSION/cacti.sql &&
cat cacti-$VERSION/cacti.sql | sed "s%^INSERT INTO settings VALUES ('path_rrdtool','<DEFAULT>');%INSERT INTO settings VALUES ('path_rrdtool','/usr/components/rrdtool/bin/rrdtool');%" > /tmp/cacti.$$ &&
mv /tmp/cacti.$$ cacti-$VERSION/cacti.sql &&
cat cacti-$VERSION/cacti.sql | sed "s%^INSERT INTO settings VALUES ('path_php_binary','<DEFAULT>');%INSERT INTO settings VALUES ('path_php_binary','/usr/bin/php');%" > /tmp/cacti.$$ &&
mv /tmp/cacti.$$ cacti-$VERSION/cacti.sql &&
cat cacti-$VERSION/cacti.sql | sed "s%^INSERT INTO settings VALUES ('smnp_version','ucd-snmp');%INSERT INTO settings VALUES ('smnp_version','net-snmp');%" > /tmp/cacti.$$ &&
mv /tmp/cacti.$$ cacti-$VERSION/cacti.sql &&

# configure the mysql cacti database
mysql -u root < cacti1.sql &&
( if [ -f sentinix_cacti.sql ]; then
    mysql -u root cacti < sentinix_cacti.sql
  else
    mysql -u root cacti < cacti-$VERSION/cacti.sql
  fi ) &&
mysql -u root mysql < cacti2.sql &&
(   cd cacti-$VERSION &&
    cat include/config.php | sed 's%^$database_password = "cactiuser"%$database_password = "sentinix"%' > /tmp/cacti.$$ &&
    mv /tmp/cacti.$$ include/config.php
) &&
rm -rf /usr/components/cacti &&
mkdir /usr/components/cacti &&
installwatch -o $CWD/installwatch.log cp -a cacti-$VERSION/* /usr/components/cacti/ &&
rm -rf /usr/components/cacti/cactid &&
chown -R root.root /usr/components/cacti/

### cruft
##
## we don't compile and install cactid, it's not stable yet
##
#cd $CWD/cacti-$VERSION/cactid &&
#./configure --prefix=/usr/components/cactid --host=$TARGET-sentinix-linux &&
#make &&
## configure cactid.conf
#cat cactid.conf | sed "s%^DB_Pass[\t][\t]cactiuser%DB_Pass\t\tsentinix%g"
#make -n install

