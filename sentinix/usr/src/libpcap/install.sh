#!/bin/sh

source sxconfig &&
cd libpcap-$PCAPVER &&
make install
