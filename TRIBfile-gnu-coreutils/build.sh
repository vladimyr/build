#!/bin/sh
#
${THOME}/build/dobuild -gnu coreutils-8.29 -P /usr/gnu -C --without-gmp
${THOME}/build/genpkg TRIBfile-gnu-coreutils coreutils-8.29
