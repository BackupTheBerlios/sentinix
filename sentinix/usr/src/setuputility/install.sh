#!/bin/sh
# $Id: install.sh,v 1.2 2004/01/14 03:49:16 replikan Exp $
CWD=`pwd`

cd /usr/local &&
tar -xf $CWD/setuptools_temp.tar &&
cd $CWD &&
rm -f setuptools_temp.tar
