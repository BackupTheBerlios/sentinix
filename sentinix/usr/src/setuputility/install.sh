#!/bin/sh
# $Id: install.sh,v 1.5 2004/01/16 02:03:52 replikan Exp $
CWD=`pwd`

cd /usr/local &&
tar -xf $CWD/setuptools_temp.tar &&
cd $CWD &&
rm -f setuptools_temp.tar
