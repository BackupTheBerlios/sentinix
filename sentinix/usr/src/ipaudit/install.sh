#!/bin/sh
CWD=`pwd`

source sxconfig &&
cd ipaudit-$VERSION &&

# There is not "make install" so we copy the binaries and the manpages into location
cp src/{ipaudit,ipstrings,total} /usr/bin/ &&
cp man/man1/{ipaudit.1,ipstrings.1,total.1} /usr/man/man1/
