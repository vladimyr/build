#!/bin/sh
#
${THOME}/build/dobuild -64 libSM-1.2.3 -C "--enable-unix-transport --enable-tcp-transport --enable-ipv6 --without-libuuid"
${THOME}/build/genpkg TRIBx11-libsm libSM-1.2.3
