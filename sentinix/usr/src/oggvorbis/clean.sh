#!/bin/sh

. sxconfig &&
rm -rf libao-${libaoVER} &&
rm -rf libogg-${liboggVER} &&
rm -rf libvorbis-${libvorbisVER} &&
rm -rf vorbis-tools-${toolsVER} &&
rm -f installwatch_?.log installwatch.log
