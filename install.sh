#!/bin/sh
HERE=`pwd`
C=$HOME/.conky/naheel
mkdir -p $C
./gen-main.rc.sh > $C/main.rc
gcc bin.c -o $C/bin
cat ./config.rc > $C/bin.rc
sed -e "s@BINARY@$C/bin@g" bin.rc >> $C/bin.rc

