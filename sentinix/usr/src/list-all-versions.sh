#!/bin/sh
CWD=`pwd`

source sxconfig || exit 1

if [ "$SRC" = "" ]; then
    echo "SRC variable is fubar!"
    exit 1
fi

for i in $SRC
do
    if [ ! -e $i/SKIP ]; then
	make -s -C $i version
    fi
done
