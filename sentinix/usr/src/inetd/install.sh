#!/bin/sh

cd inetd &&
cat inetd > /usr/sbin/inetd &&     
chown root:daemon /usr/sbin/inetd &&
chmod 0550 /usr/sbin/inetd &&
gzip inetd.8 &&
cat inetd.8.gz > /usr/man/man8/inetd.8.gz
