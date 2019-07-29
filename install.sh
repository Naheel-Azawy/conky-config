#!/bin/sh
make clean && make && sudo make install
C="$HOME/.conky/naheel"
rm -rf "$C"
mkdir -p "$C"
ln -s /usr/share/conky/naheel "$C"
