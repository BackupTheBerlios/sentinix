#!/bin/sh
source ../sxarchconfig &&
cd usleep &&
gcc -O2 $SXARCHFLAGS -s -Wall usleep.c -o usleep
