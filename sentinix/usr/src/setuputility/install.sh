#!/bin/sh
# $Id: install.sh,v 1.10 2004/01/18 06:18:35 replikan Exp $
CWD=`pwd`

cd /usr/local &&
tar -xf $CWD/setuptools_temp.tar &&
cd $CWD &&
rm -f setuptools_temp.tar
