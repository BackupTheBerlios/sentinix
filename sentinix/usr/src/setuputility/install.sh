#!/bin/sh
# $Id: install.sh,v 1.11 2004/01/19 04:52:06 replikan Exp $
CWD=`pwd`

cd /usr/local &&
tar -xf $CWD/setuptools_temp.tar &&
cd $CWD &&
rm -f setuptools_temp.tar
