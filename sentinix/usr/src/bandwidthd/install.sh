#!/bin/sh
CWD=`pwd`

source sxconfig &&
./clean.sh &&
tar -xzf bandwidthd-$VERSION.tgz &&
cd bandwidthd-$VERSION &&
chown -R root.root . &&
cat Makefile | sed "s%/usr/local/bandwidthd%/usr/components/bandwidthd%" > new.Makefile.$$ &&
mv new.Makefile.$$ Makefile &&
make &&
make install &&
cp $CWD/bandwidthd.cron /etc/cron.daily/bandwidthd &&
chmod 0644 /etc/cron.daily/bandwidthd &&
# edit /usr/components/bandwidthd/etc/bandwidthd.conf
cd /usr/components/bandwidthd/etc &&

cat bandwidthd.conf | sed 's/^subnet /#subnet /g' > new.bandwidthd.conf.$$ &&
mv new.bandwidthd.conf.$$ bandwidthd.conf &&

cat bandwidthd.conf | sed 's/^#output_cdf false$/output_cdf true/g' > new.bandwidthd.conf.$$ &&
mv new.bandwidthd.conf.$$ bandwidthd.conf &&
cat bandwidthd.conf | sed 's/^#recover_cdf false$/recover_cdf true/g' > new.bandwidthd.conf.$$ &&
mv new.bandwidthd.conf.$$ bandwidthd.conf &&

cat bandwidthd.conf | sed -e '/^# Device to listen on$/i \
# dirty way to stat every IP, change to your subnets:\
subnet 0.0.0.0 0.0.0.0\

' > new.bandwidthd.conf.$$ &&
mv new.bandwidthd.conf.$$ bandwidthd.conf
