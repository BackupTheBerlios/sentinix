#!/bin/sh

source sxconfig &&
cd psmisc-$VERSION &&
make install &&
rm -f /usr/share/man/man1/pidof.1 &&
ln -s killall /bin/pidof
