#!/bin/sh
CWD=`pwd`

source sxconfig &&
./clean.sh &&
tar xzvf $CWD/portmap_$VERSION.tar.gz &&
cd portmap_$VERSION &&
zcat $CWD/portmap_4.diff.gz | patch -p1 --backup --suffix=.orig &&
make FACILITY=LOG_AUTH ZOMBIES='-DIGNORE_SIGCHLD -Dlint' LIBS="-lnsl" &&
strip portmap pmap_dump pmap_set
