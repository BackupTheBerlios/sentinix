#!/bin/sh
CWD=`pwd`

source ../sxarchconfig &&
source sxconfig &&
./clean.sh &&
tar -xzf sendmail.$VERSION.tar.gz &&
cd sendmail-$VERSION &&
chown -R root.root . &&

# add TLS support
cat $CWD/site.config.m4 > devtools/Site/site.config.m4 &&

# build sendmail.cf
cd $CWD/sendmail-$VERSION/cf/cf &&

sed -e "s@^\(include(\`/usr/share/sendmail-cf/m4/cf.m4')\)@dnl \1@" $CWD/sendmail.mc > sendmail-sentinix.mc &&
sh Build sendmail-sentinix.cf &&

cd $CWD/sendmail-$VERSION &&
make O="-O2 $SXARCHFLAGS -fstack-protector"
