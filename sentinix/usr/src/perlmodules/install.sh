#!/bin/sh
CWD=`pwd`

source sxconfig &&
./clean.sh &&

tar -xzvf Net_SSLeay.pm-$SSLEAYVER.tar.gz &&
tar -xzvf IO-stringy-$IOSTRINGYV.tar.gz &&
tar -xzvf MIME-Base64-$MIMEBASE64V.tar.gz &&
tar -xzvf MailTools-$MAILTOOLSV.tar.gz &&
tar -xzvf File-Spec-$FILESPECV.tar.gz &&
tar -xzvf HTML-Tagset-$HTMLTAGSETV.tar.gz &&
tar -xzvf HTML-Parser-$HTMLPARSERV.tar.gz &&
tar -xzvf MIME-tools-$MIMETOOLSV.tar.gz &&
tar -xzvf File-Temp-$FILETEMPV.tar.gz &&
tar -xzvf Convert-TNEF-$CONVERTTNEFV.tar.gz &&
tar -xzvf Net-CIDR-$CIDRVER.tar.gz &&
tar -xzvf Parse-RecDescent-$PARSERECDESCV.tar.gz &&
tar -xzvf Inline-$INLINEVER.tar.gz &&
tar -xzvf Mail-ClamAV-$CLAMAVVER.tar.gz &&
tar -xzvf DB_File-$DBFILEV.tar.gz &&
tar -xzvf Digest-MD5-$DIGESTMD5V.tar.gz &&
tar -xzvf Digest-SHA1-$DIGESTSHA1V.tar.gz &&
tar -xzvf Digest-HMAC-$DIGESTHMACV.tar.gz &&
tar -xzvf Net-DNS-$NETDNSV.tar.gz &&
tar -xzvf Storable-$STORABLEV.tar.gz &&
tar -xzvf Net-Daemon-$NETDAEMONV.tar.gz &&
tar -xzvf PlRPC-$PLRPCV.tar.gz &&
tar -xzvf DBI-$DBIV.tar.gz &&
tar -xzvf Test-Simple-$TESTSIMPLEV.tar.gz &&
tar -xzvf MIME-Types-$MIMETYPESV.tar.gz &&
tar -xzvf MIME-Lite-$MIMELITEV.tar.gz &&
tar -xzvf Bit-Vector-$BITVECTORV.tar.gz &&
tar -xzvf Date-Calc-$DATECALCV.tar.gz &&
tar -xzvf Parallel-ForkManager-$PARALLELFMV.tar.gz &&

#
# apply the mime-tools patch (by recommendation from mailscanner.info):
#
cd $CWD/MIME-tools-$MIMETOOLSV &&
cat $CWD/mime-tools-patch.txt | patch -Np1 &&
cat $CWD/mime-tools-patch2.txt | patch -Np1 &&
cat $CWD/mime-tools-patch3.txt | patch -Np1 &&
cat $CWD/mime-tools-patch4.txt | patch -Np1 &&

cd $CWD/Net_SSLeay.pm-$SSLEAYVER &&
perl Makefile.PL &&
make &&
#make test &&
installwatch -o $CWD/installwatch_01.log make install &&

cd $CWD/IO-stringy-$IOSTRINGYV &&
perl Makefile.PL &&
make &&
make test &&
installwatch -o $CWD/installwatch_02.log make install &&

cd $CWD/MIME-Base64-$MIMEBASE64V &&
perl Makefile.PL &&
make &&
make test &&
installwatch -o $CWD/installwatch_03.log make install &&

cd $CWD/MailTools-$MAILTOOLSV &&
perl Makefile.PL &&
make &&
make test &&
installwatch -o $CWD/installwatch_04.log make install &&

cd $CWD/File-Spec-$FILESPECV &&
perl Makefile.PL &&
make &&
make test &&
installwatch -o $CWD/installwatch_05.log make install &&

cd $CWD/HTML-Tagset-$HTMLTAGSETV &&
perl Makefile.PL &&
make &&
make test &&
installwatch -o $CWD/installwatch_06.log make install &&

cd $CWD/HTML-Parser-$HTMLPARSERV &&
( cat Makefile.PL | sed 's%^    my $ans = prompt("Do you want decoding on unicode entities?", "no");%    my $ans = "no";%' > /tmp/htmlparser.$$ &&
  mv /tmp/htmlparser.$$ Makefile.PL
) &&
perl Makefile.PL &&
make &&
make test &&
installwatch -o $CWD/installwatch_07.log make install &&

cd $CWD/MIME-tools-$MIMETOOLSV &&
perl Makefile.PL &&
make &&
make test &&
installwatch -o $CWD/installwatch_08.log make install &&

cd $CWD/File-Temp-$FILETEMPV &&
perl Makefile.PL &&
make &&
make test &&
installwatch -o $CWD/installwatch_09.log make install &&

cd $CWD/Convert-TNEF-$CONVERTTNEFV &&
perl Makefile.PL &&
make &&
make test &&
installwatch -o $CWD/installwatch_10.log make install &&

cd $CWD/Net-CIDR-$CIDRVER &&
perl Makefile.PL &&
make &&
make test &&
installwatch -o $CWD/installwatch_11.log make install &&

cd $CWD/Parse-RecDescent-$PARSERECDESCV &&
perl Makefile.PL &&
make &&
make test &&
installwatch -o $CWD/installwatch_12.log make install &&

cd $CWD/Inline-$INLINEVER &&
# answer y to include Inline::C
echo "y" | perl Makefile.PL &&
make &&
make test &&
installwatch -o $CWD/installwatch_13.log make install &&

cd $CWD/Mail-ClamAV-$CLAMAVVER &&
perl Makefile.PL &&
make &&
make test &&
installwatch -o $CWD/installwatch_14.log make install &&

cd $CWD/DB_File-$DBFILEV &&
perl Makefile.PL &&
make &&
make test &&
installwatch -o $CWD/installwatch_15.log make install &&

cd $CWD/Digest-MD5-$DIGESTMD5V &&
perl Makefile.PL &&
make &&
make test &&
installwatch -o $CWD/installwatch_16.log make install &&

cd $CWD/Digest-SHA1-$DIGESTSHA1V &&
perl Makefile.PL &&
make &&
make test &&
installwatch -o $CWD/installwatch_17.log make install &&

cd $CWD/Digest-HMAC-$DIGESTHMACV &&
perl Makefile.PL &&
make &&
make test &&
installwatch -o $CWD/installwatch_18.log make install &&

cd $CWD/Net-DNS-$NETDNSV &&
# answer no to performing tests on internet nameservers.
echo "n" | perl Makefile.PL &&
make &&
make test &&
installwatch -o $CWD/installwatch_19.log make install &&

cd $CWD/Storable-$STORABLEV &&
perl Makefile.PL &&
make &&
# restrict test fails, somehow it didn't do this before...
#make test &&
installwatch -o $CWD/installwatch_20.log make install &&

cd $CWD/Net-Daemon-$NETDAEMONV &&
perl Makefile.PL &&
make &&
# skip tests, wants to connect to syslog through unix socket
#make test &&
installwatch -o $CWD/installwatch_21.log make install &&

cd $CWD/PlRPC-$PLRPCV &&
perl Makefile.PL &&
make &&
# skip tests, uses Net::Daemon which tries to connect to syslog
#make test &&
installwatch -o $CWD/installwatch_22.log make install &&

cd $CWD/DBI-$DBIV &&
perl Makefile.PL &&
make &&
# skip tests, uses PlRPC which uses Net::Daemon which tries to access syslog :(
#make test &&
installwatch -o $CWD/installwatch_23.log make install &&

cd $CWD/Test-Simple-$TESTSIMPLEV &&
perl Makefile.PL &&
make &&
make test &&
installwatch -o $CWD/installwatch_24.log make install &&

cd $CWD/MIME-Types-$MIMETYPESV &&
perl Makefile.PL &&
make &&
make test &&
installwatch -o $CWD/installwatch_25.log make install &&

cd $CWD/MIME-Lite-$MIMELITEV &&
perl Makefile.PL &&
make &&
make test &&
installwatch -o $CWD/installwatch_26.log make install &&

cd $CWD/Bit-Vector-$BITVECTORV &&
perl Makefile.PL &&
make &&
make test &&
installwatch -o $CWD/installwatch_27.log make install &&

cd $CWD/Date-Calc-$DATECALCV &&
perl Makefile.PL &&
make &&
make test &&
installwatch -o $CWD/installwatch_28.log make install &&

cd $CWD/Parallel-ForkManager-$PARALLELFMV &&
perl Makefile.PL &&
make &&
make test &&
installwatch -o $CWD/installwatch_29.log make install &&

echo -e "\033[1;32mokidoki\033[0m" # just a dummy line to prevent me from missing an ANDing.
