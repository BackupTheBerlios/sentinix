#!/bin/sh
CWD=`pwd`

source sxconfig &&
cd debianutils-$VERSION &&
cp mktemp /usr/bin/ &&
cp mktemp.1 /usr/man/man1/ &&
cp savelog /usr/bin/ &&
chmod +x /usr/bin/savelog &&
cp savelog.8 /usr/man/man8/ &&
cp tempfile /usr/bin/ &&
cp tempfile.1 /usr/man/man1/ &&
cp readlink /usr/bin/
