#!/bin/sh
CWD=`pwd`

#
# installwatch is Copyright (C) 1998-9 Pancrazio `Ezio' de Mauro <p@demauro.net>
#
function installwatch_start {
    unset INSTALLWATCH_BACKUP_PATH
    unset INSTALLWATCHFILE
    LD_PRELOAD=/usr/lib/installwatch.so
    INSTALLWATCHFILE="$1"
    export LD_PRELOAD INSTALLWATCHFILE
}

function installwatch_stop {
    unset LD_PRELOAD
    unset INSTALLWATCHFILE
}

source ../sxarchconfig || exit 1
source sxconfig || exit 1

#####################################################
echo
echo -e "\033[1mUnpacking Apache $VERSION\033[0m"
echo
./clean.sh &&
tar -xzf apache_$VERSION.tar.gz &&
tar -xzf mod_ssl-$MODSSLVER.tar.gz &&
cd $CWD/mod_ssl-$MODSSLVER &&
zcat $CWD/mod_ssl-sdbm.diff.gz | patch -Np1 &&
chown -R root.root . &&
cd $CWD/apache_$VERSION &&
zcat $CWD/sentinix.config.diff.gz | patch -Np0 &&

cat $CWD/mod_ssl-$MODSSLVER/pkg.eapi/eapi.patch | patch -Np0 &&
cat $CWD/mod_ssl-$MODSSLVER/pkg.addon/addon.patch | patch -Np0 &&
cat $CWD/mod_ssl-$MODSSLVER/pkg.sslsup/sslsup.patch | patch -Np0 &&

cd $CWD/mod_ssl-$MODSSLVER &&
cp -a pkg.eapi/*.h $CWD/apache_$VERSION/src/include/ &&
cp -a pkg.eapi/*.c $CWD/apache_$VERSION/src/ap/ &&
cp -a pkg.addon/*.c $CWD/apache_$VERSION/src/modules/extra/ &&
cp -a pkg.addon/*.html $CWD/apache_$VERSION/htdocs/manual/mod/ &&
cd $CWD/apache_$VERSION/ &&
chown -R root.root . &&
# apply gdbm_compat patch
patch -Np1 -i $CWD/gdbm_compat.patch &&
# configuring apache
CFLAGS="-O2 $SXARCHFLAGS -fstack-protector" EAPI=SYSTEM ./configure \
    --with-layout=Sentinix \
    --enable-module=most \
    --enable-shared=max \
    --manualdir=/var/www/htdocs/manual \
    --enable-rule=eapi &&
make &&
cd $CWD/apache_$VERSION &&

installwatch_start $CWD/installwatch.log &&
make install &&
installwatch_stop
if [ ! $? -eq 0 ]; then
    echo
    echo -e "\033[1;31mCompilation of Apache $VERSION failed.\033[0m"
    echo
    exit 1
fi

#####################################################
#
# build mod_ssl
#
cd $CWD
./build.mod_ssl &&
cd $CWD/mod_ssl-$MODSSLVER &&
installwatch_start $CWD/installwatch.log &&
make install &&
installwatch_stop
if [ ! $? -eq 0 ]; then
    exit 1
fi

installwatch_start $CWD/installwatch.log &&
cat $CWD/mod_ssl.conf.example > /etc/apache/mod_ssl.conf &&
cp pkg.contrib/sign.sh /usr/bin/ &&

mkdir -p /etc/apache/ssl.crl \
	/etc/apache/ssl.crt \
	/etc/apache/ssl.csr \
	/etc/apache/ssl.key \
	/etc/apache/ssl.prm &&

installwatch_stop

if [ ! $? -eq 0 ]; then
	exit 1
fi

#####################################################
#
# build PHP
#
cd $CWD
./build.php &&
cd $CWD/php-$PHPVER &&
installwatch_start $CWD/installwatch.log &&
make install
if [ ! $? -eq 0 ]; then
	echo
	echo "PHP compilation failed!"
	echo
	exit 1
fi

cp php.ini-dist /etc/apache/ &&
cp php.ini-recommended /etc/apache/ &&

installwatch_stop

if [ ! $? -eq 0 ]; then
	echo
	echo "failed!"
	echo
	exit 1
fi

echo
echo -e "\033[32mApache+mod_ssl+PHP built and installed.\033[0m"
echo
