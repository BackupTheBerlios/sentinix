#!/bin/sh
CWD=`pwd`

source sxconfig &&
./clean.sh &&
tar -xzf debianutils_$VERSION.tar.gz &&
cd debianutils-$VERSION &&
chown -R root.root . &&
patch -Np1 -i $CWD/unterminated_string_fix.diff &&
make &&
strip mktemp readlink run-parts tempfile
