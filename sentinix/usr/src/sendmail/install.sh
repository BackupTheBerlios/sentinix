#!/bin/sh
CWD=`pwd`

source sxconfig &&
cd sendmail-$VERSION &&
make install || exit 1

# if exists, remove old sendmail-cf 
if [ -e /usr/share/sendmail-cf ]; then
    echo "Removing old /usr/share/sendmail-cf files"
    rm -rf /usr/share/sendmail-cf || exit 1
fi

mkdir -p /usr/share/sendmail-cf &&

echo "Installing sendmail-cf" &&
cp -a $CWD/sendmail-$VERSION/cf/. /usr/share/sendmail-cf/ &&

cp $CWD/sendmail-$VERSION/cf/cf/sendmail-sentinix.cf /etc/mail/sendmail.cf &&
cp $CWD/sendmail.mc /etc/mail/sendmail.mc

# done
