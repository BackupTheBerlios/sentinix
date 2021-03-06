#!/bin/sh
#
# From Slackware 9.1
#
# We (I?) really need to make our own tcpip package, this contains
# too much (for SENTINIX) useless stuff.
#

#
# Set initial variables:
CWD=`pwd`
TMP=$CWD/temp
PKG=""

./clean.sh
mkdir -p $TMP

echo "+==================+"
echo "| tcp_wrappers_7.6 |"
echo "+==================+"
cd $TMP
tar xzvf $CWD/tcp_wrappers_7.6.tar.gz
cd tcp_wrappers_7.6
zcat $CWD/tcp_wrappers_7.6.diff.gz | patch -p1 --backup
make REAL_DAEMON_DIR=/usr/sbin linux || exit 1
strip tcpd safe_finger tcpdchk tcpdmatch try-from
cat libwrap.a > $PKG/usr/lib/libwrap.a
cat tcpd.h > $PKG/usr/include/tcpd.h
cat safe_finger > $PKG/usr/sbin/safe_finger
cat tcpd > $PKG/usr/sbin/tcpd
cat tcpdchk > $PKG/usr/sbin/tcpdchk
cat tcpdmatch > $PKG/usr/sbin/tcpdmatch
cat try-from > $PKG/usr/sbin/try-from
cat hosts_access.3 > $PKG/usr/man/man3/hosts_access.3
cat hosts_access.5 > $PKG/usr/man/man5/hosts_access.5
cat hosts_options.5 > $PKG/usr/man/man5/hosts_options.5
cat tcpd.8 > $PKG/usr/man/man8/tcpd.8
cat tcpdchk.8 > $PKG/usr/man/man8/tcpdchk.8
cat tcpdmatch.8 > $PKG/usr/man/man8/tcpdmatch.8
mkdir -p $PKG/usr/doc/tcp_wrappers_7.6
cp -a \
  BLURB CHANGES DISCLAIMER README README.NIS \
  $PKG/usr/doc/tcp_wrappers_7.6
chown root.root $PKG/usr/doc/tcp_wrappers_7.6/*
chmod 644 $PKG/usr/doc/tcp_wrappers_7.6/*

echo "+===============+"
echo "| icmpinfo-1.11 |"
echo "+===============+"
cd $TMP
tar xzvf $CWD/icmpinfo-1.11.tar.gz
cd icmpinfo-1.11
zcat $CWD/icmpinfo-1.11.diff.gz | patch -p1 --backup
zcat $CWD/icmpinfo-1.11.diff2.gz | patch -p1 --backup
make || exit 1
strip icmpinfo
cat icmpinfo > $PKG/usr/sbin/icmpinfo
cat icmpinfo.man > $PKG/usr/man/man1/icmpinfo.1
mkdir -p $PKG/usr/doc/icmpinfo-1.11
cp -a \
  CHANGES CHECKSUMS.asc README TODO \
  $PKG/usr/doc/icmpinfo-1.11
chown root.root $PKG/usr/doc/icmpinfo-1.11/*
chmod 644 $PKG/usr/doc/icmpinfo-1.11/*

echo "+================+"
echo "| net-tools-1.60 |"
echo "+================+"
cd $TMP
tar xjvf $CWD/net-tools-1.60.tar.bz2
cd net-tools-1.60
patch -Np1 -i $CWD/net-tools_mii-tools.patch
zcat $CWD/net-tools.diff.gz | patch -p1 --backup
mkdir -p $PKG/usr/doc/net-tools-1.60
cp -a README README.ipv6 $PKG/usr/doc/net-tools-1.60
chmod 644 $PKG/usr/doc/net-tools-1.60/*
chown root.root $PKG/usr/doc/net-tools-1.60/*
HAVE_IP_TOOLS=1 HAVE_MII=1 make || exit 1
strip ipmaddr iptunnel hostname arp ifconfig rarp route netstat plipconfig slattach mii-tool
cat arp > $PKG/sbin/arp
cat ifconfig > $PKG/sbin/ifconfig
cat rarp > $PKG/sbin/rarp
cat route > $PKG/sbin/route
cat hostname > $PKG/bin/hostname
cat mii-tool > $PKG/sbin/mii-tool
cat netstat > $PKG/bin/netstat
cat plipconfig > $PKG/sbin/plipconfig
cat slattach > $PKG/usr/sbin/slattach
cat ipmaddr > $PKG/sbin/ipmaddr
cat iptunnel > $PKG/sbin/iptunnel
cd man/en_US
for page in dnsdomainname.1 domainname.1 hostname.1 nisdomainname.1 \
  ypdomainname.1 ; do
  cat $page > $PKG/usr/man/man1/$page
done
cat ethers.5 > $PKG/usr/man/man5/ethers.5
for page in arp.8 ifconfig.8 mii-tool.8 netstat.8 rarp.8 route.8 \
  slattach.8 plipconfig.8 ; do
  cat $page > $PKG/usr/man/man8/$page
done

echo "+=========+"
echo "| netdate |"
echo "+=========+"
cd $TMP
tar xzvf $CWD/netdate.tar.gz
cd netdate
zcat $CWD/netdate.diff.gz | patch -p1 --backup
zcat $CWD/netdate.diff2.gz | patch -p1 --backup
make || exit 1
strip netdate
cat netdate > $PKG/usr/sbin/netdate
cat netdate.8 > $PKG/usr/man/man8/netdate.8

echo "+==================+"
echo "| netkit-base-0.17 |"
echo "+==================+"
cd $TMP
tar xzvf $CWD/netkit-base-0.17.tar.gz
cd netkit-base-0.17
# This is a patch to fix ping times > 1s.
zcat $CWD/netkit-base.ping.diff.gz | patch -p1 --verbose --backup --suffix=.orig
./configure --prefix=/usr
make || exit 1
cd inetd
strip inetd
#cat inetd > $PKG/usr/sbin/inetd
#cat inetd.8 | gzip -9c > $PKG/usr/man/man8/inetd.8.gz
cd ../ping
strip ping
cat ping > $PKG/bin/ping
cat ping.8 > $PKG/usr/man/man8/ping.8
cd ..
mkdir -p $PKG/usr/doc/netkit-base-0.17
cp -a README $PKG/usr/doc/netkit-base-0.17
chown root.root $PKG/usr/doc/netkit-base-0.17/*
chmod 644 $PKG/usr/doc/netkit-base-0.17/*

echo "+==================+"
echo "| biff+comsat-0.17 |"
echo "+==================+"
cd $TMP
tar xzvf $CWD/biff+comsat-0.17.tar.gz
cd biff+comsat-0.17
zcat $CWD/biff+comsat-0.17.diff.gz | patch -p1
zcat $CWD/biff+comsat.offset.diff.gz | patch -p1
./configure --prefix=/usr
make || exit 1
cd biff
strip biff
cat biff > $PKG/usr/bin/biff
cat biff.1 > $PKG/usr/man/man1/biff.1
cd ../comsat
strip comsat
cat comsat > $PKG/usr/sbin/in.comsat
cat comsat.8 > $PKG/usr/man/man8/in.comsat.8
cd ..
mkdir -p $PKG/usr/doc/biff+comsat-0.17
cp -a README $PKG/usr/doc/biff+comsat-0.17
chown root.root $PKG/usr/doc/biff+comsat-0.17/*
chmod 644 $PKG/usr/doc/biff+comsat-0.17/*

echo "+=================+"
echo "| bsd-finger-0.17 |"
echo "+=================+"
cd $TMP
tar xzvf $CWD/bsd-finger-0.17.tar.gz
cd bsd-finger-0.17
zcat $CWD/bsd-finger-0.17.diff.gz | patch -p1
./configure --prefix=/usr
make || exit 1
cd finger
strip finger
cat finger > $PKG/usr/bin/finger
cat finger.1 > $PKG/usr/man/man1/finger.1
cd ../fingerd
strip fingerd
cat fingerd > $PKG/usr/sbin/in.fingerd
cat fingerd.8 > $PKG/usr/man/man8/in.fingerd.8
cd ..
mkdir -p $PKG/usr/doc/bsd-finger-0.17
cp -a README $PKG/usr/doc/bsd-finger-0.17
chown root.root $PKG/usr/doc/bsd-finger-0.17/*
chmod 644 $PKG/usr/doc/bsd-finger-0.17/*

echo "+========================+"
echo "| netkit-bootparamd-0.17 |"
echo "+========================+"
cd $TMP
tar xzvf $CWD/netkit-bootparamd-0.17.tar.gz
cd netkit-bootparamd-0.17
./configure --prefix=/usr
make || exit 1
cd rpc.bootparamd
strip bootparamd callbootd
cat bootparamd > $PKG/usr/sbin/rpc.bootparamd
cat callbootd > $PKG/usr/bin/callbootd
cat bootparamd.8 > $PKG/usr/man/man8/rpc.bootparamd.8
mkdir -p $PKG/usr/doc/netkit-bootparamd-0.17
cp -a README $PKG/usr/doc/netkit-bootparamd-0.17
chown root.root $PKG/usr/doc/netkit-bootparamd-0.17/*
chmod 644 $PKG/usr/doc/netkit-bootparamd-0.17/*

echo "+=================+"
echo "| netkit-ftp-0.17 |"
echo "+=================+"
cd $TMP
tar xzvf $CWD/netkit-ftp-0.17.tar.gz
cd netkit-ftp-0.17
./configure --prefix=/usr
make || exit 1
cd ftp
strip ftp
cat ftp > $PKG/bin/ftp
cat ftp.1 > $PKG/usr/man/man1/ftp.1
cat netrc.5 > $PKG/usr/man/man5/netrc.5
cd ..
mkdir -p $PKG/usr/doc/netkit-ftp-0.17
cp -a README $PKG/usr/doc/netkit-ftp-0.17
chown root.root $PKG/usr/doc/netkit-ftp-0.17/*
chmod 644 $PKG/usr/doc/netkit-ftp-0.17/*

echo "+===================+"
echo "| netkit-ntalk-0.17 |"
echo "+===================+"
cd $TMP
tar xzvf $CWD/netkit-ntalk-0.17.tar.gz
cd netkit-ntalk-0.17
zcat $CWD/netkit-ntalk-0.17.diff.gz | patch -p1
./configure --prefix=/usr
make || exit 1
cd talk
strip talk
cat talk > $PKG/usr/bin/talk
cat talk.1 > $PKG/usr/man/man1/talk.1
cd ../talkd
strip talkd
cat talkd > $PKG/usr/sbin/in.talkd
cat talkd.8 > $PKG/usr/man/man8/in.talkd.8
cd ..
mkdir -p $PKG/usr/doc/netkit-ntalk-0.17
cp -a README $PKG/usr/doc/netkit-ntalk-0.17
chown root.root $PKG/usr/doc/netkit-ntalk-0.17/*
chmod 644 $PKG/usr/doc/netkit-ntalk-0.17/*

## Include old version of 'talk', which works better with
## 8-bit character sets:
#echo "+===================+"
#echo "| netkit-ntalk-0.11 |"
#echo "+===================+"
#cd $TMP
#tar xzvf $CWD/netkit-ntalk-0.11.tar.gz
#cd netkit-ntalk-0.11
#zcat $CWD/netkit-ntalk-0.11.diff.gz | patch -p0 --backup
#./configure --prefix=/usr
#make || exit 1
#cd talk
#strip talk
#cat talk > $PKG/usr/bin/talk-0.11

echo "+====================+"
echo "| netkit-routed-0.17 |"
echo "+====================+"
cd $TMP
tar xzvf $CWD/netkit-routed-0.17.tar.gz
cd netkit-routed-0.17
zcat $CWD/routed.18.candidate.final.patch.gz | patch -p1 --backup --verbose -E --suffix=.orig
zcat $CWD/netkit-routed-0.17.diff.gz | patch -p1 --backup --verbose -E --suffix=.orig
./configure --prefix=/usr
make || exit 1
strip ripquery/ripquery routed/routed
cat routed/routed > $PKG/usr/sbin/routed
cat routed/routed.8 > $PKG/usr/man/man8/routed.8
cat ripquery/ripquery > $PKG/usr/sbin/ripquery
cat ripquery/ripquery.8 > $PKG/usr/man/man8/ripquery.8
mkdir -p $PKG/usr/doc/netkit-routed-0.17
cp -a README $PKG/usr/doc/netkit-routed-0.17
chown root.root $PKG/usr/doc/netkit-routed-0.17/*
chmod 644 $PKG/usr/doc/netkit-routed-0.17/*

echo "+=================+"
echo "| netkit-rsh-0.17 |"
echo "+=================+"
cd $TMP
tar xzvf $CWD/netkit-rsh-0.17.tar.gz
cd netkit-rsh-0.17
./configure --prefix=/usr
make || exit 1
cd rsh
strip rsh
cat rsh > $PKG/usr/bin/rsh
cat rsh.1 > $PKG/usr/man/man1/rsh.1
cd ../rshd
strip rshd
cat rshd > $PKG/usr/sbin/in.rshd
cat rshd.8 > $PKG/usr/man/man8/in.rshd.8
cd ../rcp
strip rcp
cat rcp > $PKG/usr/bin/rcp
cat rcp.1 > $PKG/usr/man/man1/rcp.1
cd ../rexecd
strip rexecd
cat rexecd > $PKG/usr/sbin/in.rexecd
cat rexecd.8 > $PKG/usr/man/man8/rexecd.8
cd ../rlogin
strip rlogin
cat rlogin > $PKG/usr/bin/rlogin
cat rlogin.1 > $PKG/usr/man/man1/rlogin.1
cd ../rlogind
strip rlogind
cat rlogind > $PKG/usr/sbin/in.rlogind
cat rlogind.8 > $PKG/usr/man/man8/in.rlogind.8
cd ..
mkdir -p $PKG/usr/doc/netkit-rsh-0.17
cp -a README $PKG/usr/doc/netkit-rsh-0.17
chown root.root $PKG/usr/doc/netkit-rsh-0.17/*
chmod 644 $PKG/usr/doc/netkit-rsh-0.17/*

echo "+====================+"
echo "| netkit-rusers-0.17 |"
echo "+====================+"
cd $TMP
tar xzvf $CWD/netkit-rusers-0.17.tar.gz
cd netkit-rusers-0.17
zcat $CWD/netkit-rusers-0.17.diff.gz | patch -p1
./configure --prefix=/usr
make || exit 1
cd rpc.rusersd
strip rusersd
cat rusersd > $PKG/usr/sbin/rpc.rusersd
cat rpc.rusersd.8 > $PKG/usr/man/man8/rpc.rusersd.8
cd ../rusers
strip rusers
cat rusers > $PKG/usr/bin/rusers
cat rusers.1 > $PKG/usr/man/man1/rusers.1
cd ../rup
strip rup
cat rup > $PKG/usr/bin/rup
cat rup.1 > $PKG/usr/man/man1/rup.1
cd ..
mkdir -p $PKG/usr/doc/netkit-rusers-0.17
cp -a README $PKG/usr/doc/netkit-rusers-0.17
chown root.root $PKG/usr/doc/netkit-rusers-0.17/*
chmod 644 $PKG/usr/doc/netkit-rusers-0.17/*

echo "+===================+"
echo "| netkit-rwall-0.17 |"
echo "+===================+"
cd $TMP
tar xzvf $CWD/netkit-rwall-0.17.tar.gz
cd netkit-rwall-0.17
./configure --prefix=/usr
make || exit 1
cd rpc.rwalld
strip rwalld
cat rwalld > $PKG/usr/sbin/rpc.rwalld
cat rpc.rwalld.8 > $PKG/usr/man/man8/rpc.rwalld.8
cd ../rwall
strip rwall
cat rwall > $PKG/usr/bin/rwall
cat rwall.1 > $PKG/usr/man/man1/rwall.1
cd ..
mkdir -p $PKG/usr/doc/netkit-rwall-0.17
cp -a README $PKG/usr/doc/netkit-rwall-0.17
chown root.root $PKG/usr/doc/netkit-rwall-0.17/*
chmod 644 $PKG/usr/doc/netkit-rwall-0.17/*

echo "+==================+"
echo "| netkit-rwho-0.17 |"
echo "+==================+"
cd $TMP
tar xzvf $CWD/netkit-rwho-0.17.tar.gz
cd netkit-rwho-0.17
zcat $CWD/netkit-rwho-0.17.diff.gz | patch -p1
./configure --prefix=/usr
make || exit 1
cd rwho
strip rwho
cat rwho > $PKG/usr/bin/rwho
cat rwho.1 > $PKG/usr/man/man1/rwho.1
cd ../rwhod
strip rwhod
cat rwhod > $PKG/usr/sbin/rwhod
cat rwhod.8 > $PKG/usr/man/man8/rwhod.8
cd ../ruptime
strip ruptime
cat ruptime > $PKG/usr/bin/ruptime
cat ruptime.1 > $PKG/usr/man/man1/ruptime.1
cd ..
mkdir -p $PKG/usr/doc/netkit-rwho-0.17
cp -a README $PKG/usr/doc/netkit-rwho-0.17
chown root.root $PKG/usr/doc/netkit-rwho-0.17/*
chmod 644 $PKG/usr/doc/netkit-rwho-0.17/*

echo "+====================+"
echo "| netkit-telnet-0.17 |"
echo "+====================+"
cd $TMP
tar xzvf $CWD/netkit-telnet-0.17.tar.gz
cd netkit-telnet-0.17
zcat $CWD/netkit-telnet-0.17.diff.gz | patch -p1 --verbose --backup --suffix=.orig
zcat $CWD/netkit-telnet-0.17-ayt.patch.gz | patch -p1 --verbose --backup --suffix=.orig
./configure --prefix=/usr
cd telnetd
make || exit 1
strip telnetd
cat telnetd > $PKG/usr/sbin/in.telnetd
cat telnetd.8 > $PKG/usr/man/man8/in.telnetd.8
cd ..
# The OpenBSD version of the telnet client is superior.
mv telnet telnet-netkit
tar xzvf $CWD/telnet-OpenBSD-20020321.tar.gz
zcat $CWD/telnet-OpenBSD-20020321.diff.gz | patch -p1 --verbose --backup --suffix=.orig
( cd telnet ; make ) || exit 1
cd telnet
strip telnet
cat telnet > $PKG/bin/telnet
cat telnet.1 > $PKG/usr/man/man1/telnet.1
cd ..
mkdir -p $PKG/usr/doc/netkit-telnet-0.17
cp -a README $PKG/usr/doc/netkit-telnet-0.17
chown root.root $PKG/usr/doc/netkit-telnet-0.17/*
chmod 644 $PKG/usr/doc/netkit-telnet-0.17/*

echo "+===============+"
echo "| tftp-hpa-0.34 |"
echo "+===============+"
cd $TMP
tar xjvf $CWD/tftp-hpa-0.34.tar.bz2
cd tftp-hpa-0.34
./configure --prefix=/usr
make || exit 1
cd tftp
strip tftp
cat tftp > $PKG/usr/bin/tftp
cat tftp.1 > $PKG/usr/man/man1/tftp.1
cd ../tftpd
strip tftpd
cat tftpd > $PKG/usr/sbin/in.tftpd
cat tftpd.8 > $PKG/usr/man/man8/in.tftpd.8
cd ..
mkdir -p $PKG/usr/doc/tftp-hpa-0.34
cp -a \
  CHANGES INSTALL INSTALL.tftp README README.security \
  $PKG/usr/doc/tftp-hpa-0.34
chown root.root $PKG/usr/doc/tftp-hpa-0.34/*
chmod 644 $PKG/usr/doc/tftp-hpa-0.34/*

echo "+===================+"
echo "| netkit-timed-0.17 |"
echo "+===================+"
cd $TMP
tar xzvf $CWD/netkit-timed-0.17.tar.gz
cd netkit-timed-0.17
zcat $CWD/netkit-timed-0.17.diff.gz | patch -p1 --backup --verbose --suffix=.orig -E
./configure --prefix=/usr
make || exit 1
cd timed/timed
strip timed
cat timed > $PKG/usr/sbin/in.timed
cat timed.8 > $PKG/usr/man/man8/timed.8
cd ../timedc
strip timedc
cat timedc > $PKG/usr/sbin/timedc
cat timedc.8 > $PKG/usr/man/man8/timedc.8
cd ../..
mkdir -p $PKG/usr/doc/netkit-timed-0.17
cp -a README $PKG/usr/doc/netkit-timed-0.17
chown root.root $PKG/usr/doc/netkit-timed-0.17/*
chmod 644 $PKG/usr/doc/netkit-timed-0.17/*

echo "+===============+"
echo "| netwrite-0.17 |"
echo "+===============+"
cd $TMP
tar xzvf $CWD/netwrite-0.17.tar.gz
cd netwrite-0.17
zcat $CWD/netwrite-0.17.diff.gz | patch -p1
./configure --prefix=/usr
make || exit 1
# The versions in util-linux are better, but we'll keep in.writed just in case:
#cat write > $PKG/usr/bin/write
#cat write.1 | gzip -9c > $PKG/usr/man/man1/write.1.gz
cd writed
strip writed
cat writed > $PKG/usr/sbin/in.writed
cat writed.8 > $PKG/usr/man/man8/in.writed.8
cd ..
mkdir -p $PKG/usr/doc/netwrite-0.17
cp -a README $PKG/usr/doc/netwrite-0.17
chown root.root $PKG/usr/doc/netwrite-0.17/*
chmod 644 $PKG/usr/doc/netwrite-0.17/*

#echo "+=============+"
#echo "| whois-4.6.6 |"
#echo "+=============+"
#cd $TMP
#tar xzvf $CWD/whois_4.6.6.tar.gz
#cd whois-4.6.6
#zcat $CWD/whois.uselessoverflow.diff.gz | patch -p1
#mkdir -p $PKG/usr/doc/whois-4.6.6
#cp -a README TODO $PKG/usr/doc/whois-4.6.6
#chown -R root.root $PKG/usr/doc/whois-4.6.6
#make || exit 1
#strip whois
#cat whois > $PKG/usr/bin/whois
#cat whois.1 | gzip -9c > $PKG/usr/man/man1/whois.1.gz

echo "+========+"
echo "| ipmask |"
echo "+========+"
mkdir $TMP/ipmask
cd $TMP/ipmask
cc -s -O2 -o ipmask $CWD/ipmask.c
cat ipmask > $PKG/bin/ipmask
chown root:bin $PKG/bin/ipmask
chmod 755 $PKG/bin/ipmask

echo "+=================+"
echo "| pcnfsd.93.02.16 |"
echo "+=================+"
cd $TMP
mkdir pcnfsd
cd pcnfsd
tar xzvf $CWD/pcnfsd.93.02.16.tar.gz
zcat $CWD/pcnfsd.93.02.16.diff.gz | patch -p1 --backup
make clean
make bsd || exit 1
cp -a README $PKG/usr/doc/pcnfsd.93.02.16
chown root.root $PKG/usr/doc/pcnfsd.93.02.16/README
cat pcnfsd.8c > $PKG/usr/man/man8/pcnfsd.8
cd bsd
strip clnt.pcnfsd rpc.pcnfsd
cat clnt.pcnfsd > $PKG/usr/sbin/clnt.pcnfsd
cat rpc.pcnfsd > $PKG/usr/sbin/rpc.pcnfsd

echo "+========+"
echo "| bwnfsd |"
echo "+========+"
cd $TMP
tar xzvf $CWD/bwnfsd.tar.gz
cd bwnfsd
zcat $CWD/bwnfsd.diff.gz | patch -p1 --backup
make linux || exit 1
strip bwnfsd
cat bwnfsd > $PKG/usr/sbin/rpc.bwnfsd

echo "+============+"
echo "| mini-inews |"
echo "+============+"
cd $TMP
tar xzvf $CWD/mini-inews.tar.gz
cd inews
zcat $CWD/mini-inews.diff.gz | patch -p1 -E --verbose --backup
make || exit 1
strip inews
cat inews > $PKG/usr/bin/inews-nntp

echo "+=========+"
echo "| iputils |"
echo "+=========+"
cd $TMP
tar xjvf $CWD/iputils-ss021109-try.tar.bz2
cd iputils
chown -R root.root .
make KERNEL_INCLUDE=/usr/include || exit 1
strip arping clockdiff ping ping6 rarpd rdisc tracepath tracepath6 traceroute6
cat arping > $PKG/sbin/arping
cat clockdiff > $PKG/usr/sbin/clockdiff
# Replace old ping...
cat ping > $PKG/bin/ping
cat ping6 > $PKG/bin/ping6
cat rarpd > $PKG/usr/sbin/rarpd
cat rdisc > $PKG/usr/sbin/rdisc
cat tracepath > $PKG/usr/bin/tracepath
cat tracepath6 > $PKG/usr/bin/tracepath6
cat traceroute6 > $PKG/usr/bin/traceroute6
( cd doc
  for file in arping clockdiff ping rarpd rdisc tracepath traceroute6 ; do
    cat $file.8 > $PKG/usr/man/man8/$file.8
  done
  cd $PKG/usr/man/man8
  ln -sf ping.8.gz ping6.8.gz
  ln -sf tracepath.8.gz tracepath6.8.gz
)
mkdir -p $PKG/usr/doc/iputils-ss021109-try
cp -a \
  RELNOTES \
  $PKG/usr/doc/iputils-ss021109-try

echo "+=========+"
echo "| ethtool |"
echo "+=========+"
cd $TMP
tar xzf $CWD/ethtool-1.8.tar.gz
cd ethtool-1.8
chown -R root.root .
./configure --prefix=/usr
make || exit 1
make install DESTDIR=$PKG || exit 1
strip $PKG/usr/sbin/ethtool
chown root.bin $PKG/usr/sbin/ethtool
#gzip -9 $PKG/usr/man/man8/ethtool.8
mkdir -p $PKG/usr/doc/ethtool-1.8
cp -a \
  AUTHORS COPYING ChangeLog NEWS README \
  $PKG/usr/doc/ethtool-1.8

#
# fix permissions
#

## suid clean-up is done at the end of the "make sentinix" compilation/install process

# suid ping
#chmod 4555 $PKG/bin/ping
#chown root.bin $PKG/bin/ping

for dir in $PKG/bin $PKG/sbin $PKG/usr/bin $PKG/usr/sbin ; do
    cd $dir
    find -type f -perm 644 -exec chmod 0755 {} \; -exec chown root.bin {} \;
    find -type f -perm 640 -exec chmod 0755 {} \; -exec chown root.bin {} \;
    find -type f -perm 600 -exec chmod 0755 {} \; -exec chown root.bin {} \;
    find -type f -perm 444 -exec chmod 0755 {} \; -exec chown root.bin {} \;
done
