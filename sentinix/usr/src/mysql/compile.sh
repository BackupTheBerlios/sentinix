#!/bin/sh
CWD=`pwd`

source ../sxarchconfig &&
source sxconfig &&
./clean.sh &&
tar -xzvf mysql-$VERSION.tar.gz &&
cd mysql-$VERSION &&
chown -R root.root . &&
find . -perm 777 -exec chmod 755 {} \; &&
find . -perm 775 -exec chmod 755 {} \; &&
find . -perm 666 -exec chmod 644 {} \; &&
find . -perm 664 -exec chmod 644 {} \; &&
find . -perm 444 -exec chmod 644 {} \; &&

# I have removed --with-libwrap ... I don't think we want libwrappers support in mysql anyway
CFLAGS="-O3 $SXARCHFLAGS" CXX=gcc CXXFLAGS="-O3 $SXARCHFLAGS -felide-constructors -fno-exceptions -fno-rtti" \
./configure \
    --prefix=/usr \
    --program-prefix="" \
    --program-suffix="" \
    --host=$SXARCH-$SXSYSNAME-linux \
    --with-mysqld-user=mysql \
    --with-unix-socket-path=/var/run/mysql/mysql.sock \
    --localstatedir=/var/lib/mysql \
    --enable-thread-safe-client \
    --enable-assembler \
    --with-raid \
    --with-extra-charsets=complex \
    --without-bench \
    --without-debug &&
make
