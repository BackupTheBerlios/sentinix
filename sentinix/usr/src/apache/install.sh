#!/bin/sh
CWD=`pwd`

source ../sxarchconfig || exit 1
source sxconfig || exit 1

#####################################################
# Apache installation
#
cd $CWD/apache_$APACHEVER/ &&
make install &&

#####################################################
#
# build mod_ssl
#
cd $CWD/mod_ssl-$MODSSLVER &&
make install &&

cat $CWD/mod_ssl.conf.example > /etc/apache/mod_ssl.conf &&
cp pkg.contrib/sign.sh /usr/bin/ &&

mkdir -p /etc/apache/ssl.crl \
	/etc/apache/ssl.crt \
	/etc/apache/ssl.csr \
	/etc/apache/ssl.key \
	/etc/apache/ssl.prm &&

#####################################################
#
# build PHP
#
cd $CWD/php-$PHPVER &&
make install &&
cp php.ini-dist /etc/apache/ &&
cp php.ini-recommended /etc/apache/

if [ ! $? -eq 0 ]; then
    echo -e "\033[1;31mApache+mod_ssl+PHP installation failed.\033[0m"
    exit 1
fi

echo
echo -e "\033[32mApache+mod_ssl+PHP installed.\033[0m"
echo
