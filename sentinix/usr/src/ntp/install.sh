#!/bin/sh
CWD=`pwd`

source ../sxarchconfig &&
source sxconfig &&
cd ntp-$VERSION &&
make CFLAGS="-O2 $SXARCHFLAGS" LDFLAGS=-s install
mkdir -p /etc/ntp &&
cat $CWD/ntp.conf > /etc/ntp.conf &&
cat $CWD/ntp.conf-sample > /etc/ntp.conf-sample &&
cat $CWD/ntp.keys > /etc/ntp/ntp.keys &&
cat $CWD/step-tickers > /etc/ntp/step-tickers
