#!/bin/sh
CWD=`pwd`

source ../sxarchconfig || exit 1

#
# dangerous stuff, though necessary for the df check by configure later on
#
umount /proc
mount -t proc none /proc

rm -f /etc/mtab
ln -sf /proc/mounts /etc/mtab

#
# nagios
#
source sxconfig &&
./clean.sh &&
tar -xzf nagios-$VERSION.tar.gz &&
cd nagios-$VERSION &&
chown -R root.root . &&
CFLAGS="-O2 $SXARCHFLAGS" ./configure \
    --prefix=/usr/components/nagios \
    --host=$SXARCH-$SXSYSNAME-linux &&
make all &&
installwatch -o $CWD/installwatch_01.log $CWD/function_install_nagios.sh $CWD &&

#
# nagios-plugins
#
cd $CWD &&
tar -xzf nagios-plugins-$PLUGINSVER.tar.gz &&
cd nagios-plugins-$PLUGINSVER &&
chown -R root.root . &&
CFLAGS="-O2 $SXARCHFLAGS" ./configure \
    --prefix=/usr/components/nagios \
    --host=$SXARCH-$SXSYSNAME-linux &&
installwatch -o $CWD/installwatch_02.log $CWD/function_install_plugins.sh $CWD &&
cd $CWD &&
chown -R nagios.nagios /usr/components/nagios/libexec/ &&

installwatch -o $CWD/installwatch_03.log $CWD/function_post_install.sh $CWD &&

cd $CWD &&
( umount /proc
  rm /etc/mtab
  touch /etc/mtab
  mount none -t proc /proc )
