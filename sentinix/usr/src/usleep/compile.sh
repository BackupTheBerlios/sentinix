#!/bin/sh
source ../sxarchconfig &&
gcc -O2 $SXARCHFLAGS -s -Wall usleep.c -o usleep
