#!/bin/sh
CWD=`pwd`

source sxconfig &&
./clean.sh &&
tar -xzf Mail-SpamAssassin-$VERSION.tar.gz &&
cd Mail-SpamAssassin-$VERSION &&
chown -R root.root . &&
perl Makefile.PL CONTACT_ADDRESS="the administrator of that system" &&
make
