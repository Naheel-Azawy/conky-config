#!/bin/sh
HERE=`pwd`
H="$1"
[ "$H" = "" ] && H="$HOME"
C="$H/.conky/naheel"
mkdir -p $C
./gen-main.rc.sh > $C/main.rc
gcc bin.c -o $C/bin
cat ./config.rc > $C/bin.rc
sed -e "s@BINARY@$C/bin@g" bin.rc >> $C/bin.rc

