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
make install &&
( cd /usr/components/nagios/ &&
  tar -xzf $CWD/nagios_configfiles.tgz &&
  cd $CWD &&
  mkdir -p /usr/components/nagios/var/rw &&
  chown nagios.nobody /usr/components/nagios/var/rw &&
  chmod 6770 /usr/components/nagios/var/rw &&
  chown -R nagios.nobody /usr/components/nagios/etc &&
  chmod 0770 /usr/components/nagios/etc &&
  chmod 0660 /usr/components/nagios/etc/* &&
  chmod 0771 /usr/components/nagios/bin/nagios
) &&
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
make install &&
cd $CWD/extra_plugins &&
cp check_* /usr/components/nagios/libexec/ &&
cd $CWD &&
chown -R nagios.nagios /usr/components/nagios/libexec/ &&

( cat > /usr/components/nagios/share/.htaccess <<EOF
AuthName "Nagios Login"
AuthType Basic
AuthUserFile /usr/components/nagios/etc/htpasswd.users
require valid-user
EOF
cp /usr/components/nagios/share/.htaccess /usr/components/nagios/sbin/ &&
htpasswd -mbc /usr/components/nagios/etc/htpasswd.users nagiosadmin nagios &&
htpasswd -mb /usr/components/nagios/etc/htpasswd.users guest guest &&
chown root.nobody /usr/components/nagios/etc/htpasswd.users &&
chmod 0644 /usr/components/nagios/etc/htpasswd.users
) &&

cd /usr/components &&
tar -xzf $CWD/nagat-sentinix.tgz &&
cd $CWD &&
( umount /proc
  rm /etc/mtab
  touch /etc/mtab
  mount none -t proc /proc )
