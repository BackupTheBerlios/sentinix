#!/bin/sh
# $Id: install.sh,v 1.8 2004/01/16 03:36:27 replikan Exp $
CWD=`pwd`

cd /usr/local &&
tar -xf $CWD/setuptools_temp.tar &&
cd $CWD &&
rm -f setuptools_temp.tar
