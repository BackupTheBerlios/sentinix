#!/bin/sh
TARGETDIR=/usr/components/mailscanner

source sxconfig &&
./clean.sh &&
tar -xzf MailScanner-$VERSION.tar.gz &&
cd MailScanner-$VERSION &&
chown -R root:root . &&
# fix permissions on config files
find etc/ -type f -perm 755 -exec chmod -x '{}' \; &&
# delete cvs left-overs
find -name '.#*' -exec rm -f '{}' \; &&

# replace all occurences of /opt/MailScanner with /usr/components/mailscanner

echo "replacing /opt/MailScanner with $TARGETDIR, please wait..." &&

(
for i in `find -type f -perm 755`
do
    cat $i | sed -e "s@/opt/MailScanner@${TARGETDIR}@g" > /tmp/msi.tmf
    mv /tmp/msi.tmf $i
    chmod 755 $i
done

for i in `find -type f -perm 644`
do
    cat $i | sed -e "s@/opt/MailScanner@${TARGETDIR}@g" > /tmp/msi.tmf
    mv /tmp/msi.tmf $i
    chmod 644 $i
done
)
