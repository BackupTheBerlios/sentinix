#!/bin/sh
CWD=`pwd`

source sxconfig &&
./clean.sh &&
tar -xzvf ipaudit-$VERSION.tgz &&
cd ipaudit-$VERSION &&
chown -R root.root . &&
patch -Np1 -i $CWD/include_errno.h.diff &&
make &&

# There is not "make install" so we copy the binaries and the manpages into location
cp src/{ipaudit,ipstrings,total} /usr/bin/ &&
cp man/man1/{ipaudit.1,ipstrings.1,total.1} /usr/man/man1/
