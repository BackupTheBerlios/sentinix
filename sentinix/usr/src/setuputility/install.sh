#!/bin/sh
# $Id: install.sh,v 1.4 2004/01/16 00:25:45 replikan Exp $
CWD=`pwd`

cd /usr/local &&
tar -xf $CWD/setuptools_temp.tar &&
cd $CWD &&
rm -f setuptools_temp.tar
