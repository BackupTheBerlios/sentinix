#!/bin/sh
# $Id: install.sh,v 1.7 2004/01/16 03:12:07 replikan Exp $
CWD=`pwd`

cd /usr/local &&
tar -xf $CWD/setuptools_temp.tar &&
cd $CWD &&
rm -f setuptools_temp.tar
