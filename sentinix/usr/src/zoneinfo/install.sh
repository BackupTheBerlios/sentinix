#!/bin/sh

tar -C /usr/share -xzf zoneinfo-sentinix-linux.tgz &&
rm -f /usr/share/zoneinfo/timeconfig
