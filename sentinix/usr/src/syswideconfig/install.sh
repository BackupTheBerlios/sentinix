#!/bin/sh

sh build.nessus &&
sh build.apache &&
sh build.mysql &&
sh build.snortcenter &&
sh build.crontab
