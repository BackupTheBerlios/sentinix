#!/bin/sh

source sxarchconfig || exit 1
# iwlogdir has now been created if it didn't exist

for i in $IWLOGDIR/* $IWLOGDIR/.* ; do
    if [ -e "$i" ]; then
	if [ ! "$i" = "." -o ! "$i" = ".." ]; then
	    echo $i
	    # rm -rf $i
	fi
    fi
done
