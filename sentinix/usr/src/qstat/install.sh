#!/bin/sh

source ../sxarchconfig &&
source sxconfig &&
cd qstat$VERSION &&
mkdir -p /usr/share/qstat &&
mkdir -p /usr/share/doc/qstat &&
cp qstat /usr/bin/ &&
cp template/* /usr/share/qstat/ &&
cp info/* /usr/share/doc/qstat/ &&
cp qstatdoc.html /usr/share/doc/qstat/ &&
cp qstat.cfg /usr/share/qstat/ &&
cp qstat.cfg /etc/sample-qstat.cfg
