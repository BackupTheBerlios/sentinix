#!/bin/sh
CWD=`pwd`

source sxconfig &&
cd makedev-${VERSION}.orig &&

# we don't copy the manpage since it's out of date after the patch is applied.

cp MAKEDEV /dev &&
chmod 0754 /dev/MAKEDEV &&
chown root.root /dev/MAKEDEV
