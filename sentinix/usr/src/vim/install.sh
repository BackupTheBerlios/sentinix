#!/bin/sh

cd vim62 &&
make install &&
strip /usr/bin/vim &&
ln -s /usr/bin/vim /usr/bin/vi
