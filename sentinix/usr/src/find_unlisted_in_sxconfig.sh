#!/bin/sh

CWD=`pwd`

source sxconfig || exit 1

if [ "$SRC" = "" ]; then
    echo "SRC variable is fubar!"
    exit 1
fi


for i in *
do
    if [ -d $i ]; then

	FOUND=0

	for x in $SRC
        do
	    if [ "$i" = "$x" ]; then
		FOUND=1
	    fi
        done

	if [ $FOUND -eq 0 ]; then
	    echo "$i not found in sxconfig."
	fi

    fi
done

