#!/bin/sh

CWD=`pwd`

source sxconfig || exit 1

if [ "$SRC" = "" ]; then
    echo "SRC variable is fubar!"
    exit 1
fi

for i in $SRC
do
    cd $i
    if [ -e clean.sh ]; then
	echo -e "\033[1mCleaning $i ...\033[0m"
	./clean.sh
    fi
    cd $CWD
done

echo
echo Done.
echo
