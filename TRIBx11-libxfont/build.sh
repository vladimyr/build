#!/bin/sh
#
${THOME}/build/dobuild -64 libXfont-1.5.4 +P /usr/lib/xorg -C "--enable-freetype --enable-fc --enable-builtins --with-bzip2 --enable-snfformat"
${THOME}/build/genpkg TRIBx11-libxfont libXfont-1.5.4
