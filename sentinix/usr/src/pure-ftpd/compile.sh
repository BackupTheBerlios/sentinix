#!/bin/sh

source ../sxarchconfig &&
source sxconfig &&
./clean.sh &&
tar -xzf pure-ftpd-$VERSION.tar.gz &&
cd pure-ftpd-$VERSION &&
chown -R root.root . &&
./configure \
    --prefix=/usr \
    --host=$SXARCH-$SXSYSNAME-linux \
    --with-throttling \
    --with-puredb \
    --with-ratios \
    --with-quotas \
    --with-ftpwho \
    --with-virtualhosts \
    --with-largefile \
    --with-language=english \
    --with-uploadscript \
    --with-tls \
    --with-altlog &&
make
