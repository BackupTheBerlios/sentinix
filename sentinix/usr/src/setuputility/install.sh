#!/bin/sh
# $Id: install.sh,v 1.1 2004/01/11 20:10:21 replikan Exp $
CWD=`pwd`

tar --exclude CVS -cf setuptools_temp.tar setup &&
cd /usr/local &&
tar -xf $CWD/setuptools_temp.tar &&
cd $CWD &&
rm -f setuptools_temp.tar
