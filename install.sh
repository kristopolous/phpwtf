#!/bin/sh
set -x
mkdir -p ~/bin
cp -pu phpwtf ~/bin
bunzip2 -c reference.bz2 > ~/.phpwtf-cache
