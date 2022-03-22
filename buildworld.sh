#!/bin/bash

currentdir=`pwd`

install_projects=( openframe openstats stompclient opensat aprs apns )

for i in "${install_projects[@]}"
do
  echo "Attempting to install $i"
  cd "$currentdir/$i" || { echo "$i cd failed" ; exit 1; }
  ./autogen.sh || { echo "$i autogen failed" ; exit 1; }
  ./configure || { echo "$i configure failed" ; exit 1; }
  make install || { echo "$i make install failed" ; exit 1; }
  echo "done."
done

build_projects=( openaprs openstomp aprsfeed aprsinject aprscreate apnspusher aprspruner )

for i in "${build_projects[@]}"
do
  echo "Attempting to build $i"
  cd "$currentdir/$i" || { echo "$i cd failed" ; exit 1; }
  ./autogen.sh || { echo "$i autogen failed" ; exit 1; }
  ./configure || { echo "$i configure failed" ; exit 1; }
  make install || { echo "$i make install failed" ; exit 1; }
  echo "done."
done

ldconfig
