#!/bin/sh
# $Id: install.sh,v 1.12 2004/02/01 23:32:49 replikan Exp $
CWD=`pwd`

cd /usr/local &&
tar -xf $CWD/setuptools_temp.tar &&
cd $CWD &&
rm -f setuptools_temp.tar
