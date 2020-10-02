#!/bin/sh
#
# need to have the matching Xorg server that you're building for installed
#
$THOME/build/unpack xf86-video-ast-1.1.5
cd xf86-video-ast-1.1.5
env PKG_CONFIG_PATH=/usr/lib/amd64/pkgconfig \
./configure --prefix=/usr \
--with-xorg-module-dir=/usr/lib/xorg/modules/amd64 \
CFLAGS="-m64 -O2" \
LDFLAGS="-m64" \
CXXFLAGS="-m64 -O2"
gmake -j
cd ..

${THOME}/build/genpkg TRIBxorg-driver-video-ast xf86-video-ast-1.1.5