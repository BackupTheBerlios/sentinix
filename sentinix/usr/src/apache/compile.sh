#!/bin/sh
CWD=`pwd`

source ../sxarchconfig || exit 1
source sxconfig || exit 1

#####################################################
echo
echo -e "\033[1mUnpacking Apache $APACHEVER\033[0m"
echo
./clean.sh &&
tar -xzvf apache_$APACHEVER.tar.gz &&
tar -xzvf mod_ssl-$MODSSLVER.tar.gz &&
cd $CWD/mod_ssl-$MODSSLVER &&
zcat $CWD/mod_ssl-sdbm.diff.gz | patch -Np1 &&
chown -R root.root . &&
cd $CWD/apache_$APACHEVER &&
zcat $CWD/sentinix.config.diff.gz | patch -Np0 &&

cat $CWD/mod_ssl-$MODSSLVER/pkg.eapi/eapi.patch | patch -Np0 &&
cat $CWD/mod_ssl-$MODSSLVER/pkg.addon/addon.patch | patch -Np0 &&
cat $CWD/mod_ssl-$MODSSLVER/pkg.sslsup/sslsup.patch | patch -Np0 &&

cd $CWD/mod_ssl-$MODSSLVER &&
cp -a pkg.eapi/*.h $CWD/apache_$APACHEVER/src/include/ &&
cp -a pkg.eapi/*.c $CWD/apache_$APACHEVER/src/ap/ &&
cp -a pkg.addon/*.c $CWD/apache_$APACHEVER/src/modules/extra/ &&
cp -a pkg.addon/*.html $CWD/apache_$APACHEVER/htdocs/manual/mod/ &&
cd $CWD/apache_$APACHEVER/ &&
chown -R root.root . &&
# apply gdbm_compat patch
patch -Np1 -i $CWD/gdbm_compat.patch &&
# configuring apache
EAPI=SYSTEM ./configure \
    --with-layout=Sentinix \
    --enable-module=most \
    --enable-shared=max \
    --manualdir=/var/www/htdocs/manual \
    --enable-rule=eapi &&
make
if [ ! $? -eq 0 ]; then
    echo
    echo -e "\033[1;31mCompilation of Apache $APACHEVER failed.\033[0m"
    echo
    exit 1
fi

#####################################################
#
# build mod_ssl
#
cd $CWD
./build.mod_ssl
if [ ! $? -eq 0 ]; then
    echo -e "\033[1;31mCompilation of mod_ssl $MODSSLVER failed.\033[0m"
    exit 1
fi


#####################################################
#
# build PHP
#
cd $CWD
./build.php
if [ ! $? -eq 0 ]; then
    echo
    echo "PHP compilation failed!"
    echo
    exit 1
fi

echo
echo -e "\033[32mApache+mod_ssl+PHP compiled.\033[0m"
echo
