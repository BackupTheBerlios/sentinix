#!/bin/sh
CWD=`pwd`

tar --exclude CVS -cf cgitoolkit.$$.tar cgitoolkit &&
cd /usr/components &&
tar -xf $CWD/cgitoolkit.$$.tar &&
cd $CWD &&
rm -f cgitoolkit.$$.tar
