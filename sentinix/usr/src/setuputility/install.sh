#!/bin/sh
# $Id: install.sh,v 1.9 2004/01/17 22:34:11 replikan Exp $
CWD=`pwd`

cd /usr/local &&
tar -xf $CWD/setuptools_temp.tar &&
cd $CWD &&
rm -f setuptools_temp.tar
