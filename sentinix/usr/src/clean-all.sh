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
	echo -e "\033[1mCleaning $i ...\033[0m"
	make -s -C $i clean
    fi
done

echo
echo Done.
echo
