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

sh build.nessus &&

# start installwatch
start_installwatch $CWD/installwatch.log &&
sh build.apache &&

# stop installwatch (don't do installwatch for build.mysql)
stop_installwatch &&
sh build.mysql &&

# start installwatch again
start_installwatch $CWD/installwatch.log &&

sh build.snortcenter &&
sh build.crontab
