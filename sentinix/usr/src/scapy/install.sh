#!/bin/sh

source sxconfig &&
cd scapy-$VERSION &&
cp scapy.py /usr/sbin/scapy.py &&
chmod 0750 /usr/sbin/scapy.py &&
chown root:bin /usr/sbin/scapy.py
