#!/bin/sh
if [ ! -e /proc/cpuinfo ]; then
	echo "Mounting /proc..."
	mount none -t proc /proc
	if [ ! $? -eq 0 ]; then
	    echo "Failed to mount /proc."
	    exit 1
	fi
fi
