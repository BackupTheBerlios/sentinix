#!/bin/sh
# $Id: install.sh,v 1.13 2004/02/02 16:04:41 replikan Exp $
CWD=`pwd`

cd /usr/local &&
tar -xf $CWD/setuptools_temp.tar &&
cd $CWD &&
rm -f setuptools_temp.tar
