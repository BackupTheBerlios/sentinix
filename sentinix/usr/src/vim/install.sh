#!/bin/sh

cd vim${DIRVER} &&
make install &&
strip /usr/bin/vim &&
ln -s /usr/bin/vim /usr/bin/vi
