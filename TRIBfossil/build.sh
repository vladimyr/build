#!/bin/sh
#
# rename the tarball
#  mv fossil-src-2.6.tar.gz fossil-2.6.tar.gz
#
# we've had a while with 2.0 so the sha1/sha3 switch is history
#
${THOME}/build/dobuild fossil-2.6 -C --enable-json
${THOME}/build/genpkg TRIBfossil fossil-2.6
