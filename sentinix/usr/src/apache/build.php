#!/bin/sh
CWD=`pwd`

source ../sxarchconfig || exit 1
source sxconfig || exit 1

php_configure() {
CFLAGS="-O2 $SXARCHFLAGS -fstack-protector" ./configure --prefix=/usr \
	$* \
	--enable-discard-path \
	--with-config-file-path=/etc/apache \
	--enable-safe-mode \
	--with-openssl \
	--enable-bcmatch \
	--with-bz2 \
	--enable-pic \
	--enable-calendar \
	--enable-ctype \
	--with-gdbm \
	--enable-ftp \
	--enable-gd-imgstrttf \
	--with-gd=/usr \
	--with-png-dir=/usr \
	--with-jpeg-dir=/usr \
	--with-freetype-dir=/usr \
	--with-gmp \
	--with-mysql=/usr \
	--with-xml=shared \
	--with-mm=/usr \
	--enable-trans-sid \
	--enable-shmop \
	--enable-sockets \
	--with-regex=php \
	--enable-sysvsem \
	--enable-sysvshm \
	--enable-yp \
	--enable-memory-limit \
	--with-tsrm-pthreads \
	--enable-shared \
	--disable-debug \
	--with-zlib=/usr \
	--host=$SXARCH-$SXSYSNAME-linux
}


echo
echo -e "\033[1mUnpacking PHP\033[0m"
echo
rm -rf php-$PHPVER 2> /dev/null
tar -xzf php-$PHPVER.tar.gz &&
cd php-$PHPVER &&
chown -R root.root . &&
# make the standalone interpreter:
php_configure --enable-force-cgi-redirect &&
make
if [ ! $? = 0 ]; then
	echo -e "\033[1;31mCompilation of PHP failed.\033[0m"
	exit 1
fi

(
cat sapi/cgi/php > /usr/bin/php-cgi
chmod 0755 /usr/bin/php-cgi
chown root:root /usr/bin/php-cgi
) &&
make distclean &&

# make the Apache modules:
php_configure --disable-static --with-apxs=/usr/sbin/apxs &&
make
if [ ! $? = 0 ]; then
	echo -e "\033[1;31mCompilation of PHP failed.\033[0m"
	exit 1
fi
