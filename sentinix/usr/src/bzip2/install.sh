#!/bin/sh

source sxconfig &&
cd bzip2-$VERSION &&
make install &&

### set up the usual suspects
cp bzip2-shared /bin/bzip2 &&
cp -d libbz2.so* /lib &&
ln -sf ../../lib/libbz2.so.1.0 /usr/lib/libbz2.so &&
rm /usr/bin/{bunzip2,bzcat,bzip2} &&
mv /usr/bin/{bzip2recover,bzless,bzmore} /bin &&
ln -sf bzip2 /bin/bunzip2 &&
ln -sf bzip2 /bin/bzcat

### cruft:
#cp bzip2-shared /bin/bzip2 &&
#ln -s libbz2.so.1.0 libbz2.so &&
#cp -a libbz2.so* /lib &&
#rm /lib/libbz2.so &&
#ln -s ../../lib/libbz2.so.1.0 /usr/lib/libbz2.so &&
#rm /usr/bin/{bunzip2,bzcat,bzip2} &&
#mv /usr/bin/{bzip2recover,bzless,bzmore} /bin &&
#ln -s bzip2 /bin/bunzip2 &&
#ln -s bzip2 /bin/bzcat
