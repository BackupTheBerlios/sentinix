#!/bin/sh
source ../sxarchconfig &&
gcc -O2 $SXARCHFLAGS -s -Wall usleep.c -o usleep &&
cp usleep /usr/bin/usleep &&
chmod 755 /usr/bin/usleep &&
chown root.bin /usr/bin/usleep
