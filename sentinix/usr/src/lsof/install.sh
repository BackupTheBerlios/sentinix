#!/bin/sh

source sxconfig &&
./clean.sh &&
tar -xzvf lsof_${VERSION}.tar.gz &&
tar -xvf lsof_${VERSION}/lsof_${VERSION}_src.tar &&
cd lsof_${VERSION}_src &&
chown -R root.root . &&

# lsof takes an inventory of the system
# so we just say yes here.
echo "y" | ./Configure linux &&
make &&

# lsof has no "install" routine so we have to install manually
install -o root -g bin lsof /usr/sbin &&
install -m 644 lsof.8 /usr/man/man8
