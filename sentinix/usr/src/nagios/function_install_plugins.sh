#!/bin/sh

[ "$1" = "" ] && exit 1
CWD="$1"

    make install &&
    cd $CWD/extra_plugins &&
    cp check_* /usr/components/nagios/libexec/

