#!/bin/sh
CWD=`pwd`

source sxconfig &&
./clean.sh &&
tar -xzf Mail-SpamAssassin-$SAVERSION.tar.gz &&
cd Mail-SpamAssassin-$SAVERSION &&
chown -R root.root . &&
perl Makefile.PL CONTACT_ADDRESS="the administrator of that system" &&
make &&
make install
