#!/bin/sh
CWD=`pwd`

function start_installwatch {
    unset INSTALLWATCH_BACKUP_PATH
    unset INSTALLWATCHFILE
    LD_PRELOAD=/usr/lib/installwatch.so
    INSTALLWATCHFILE="$1"
    export LD_PRELOAD INSTALLWATCHFILE
}

function stop_installwatch {
    unset LD_PRELOAD
    unset INSTALLWATCHFILE
}

# first, compile and install netwib

source ../sxarchconfig &&
source sxconfig &&

./clean.sh &&

tar -xzf netwib-$VERSION-src.tgz &&
cd netwib-$VERSION-src &&
chown -R root:root . &&
cd src &&
sed -e 's@^NETWIBDEF_INSTPREFIX=/usr/local@NETWIBDEF_INSTPREFIX=/usr@g' config.dat > new.config.dat &&
mv new.config.dat config.dat &&
./genemake &&
make &&
start_installwatch $CWD/installwatch.log &&
make install &&
stop_installwatch &&

cd $CWD &&

tar -xzf netwox-$VERSION-src.tgz &&
cd netwox-$VERSION-src &&
chown -R root:root . &&
cd src &&
sed -e 's@^NETWIBDEF_INSTPREFIX=/usr/local@NETWIBDEF_INSTPREFIX=/usr@g' config.dat > new.config.dat &&
mv new.config.dat config.dat &&
./genemake &&
make &&
start_installwatch $CWD/installwatch.log &&
make install &&
stop_installwatch

