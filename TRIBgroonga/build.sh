#!/bin/sh
#
# needs a patch to fix the headers
#
# not all subdirs can autodetect the compiler correctly, hence CC
#
env CC=gcc ${THOME}/build/dobuild -64 groonga-9.0.0 -C "--sysconfdir=/etc --localstatedir=/var"
${THOME}/build/genpkg TRIBgroonga groonga-9.0.0
