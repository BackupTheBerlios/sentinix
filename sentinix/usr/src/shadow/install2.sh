#!/bin/sh

/usr/sbin/pwconv &&
rm -f /etc/passwd- &&
rm -f /etc/shadow-
