#!/bin/sh
#
${THOME}/build/unpack Illumos-SMF-0.1.7
cd Illumos-SMF-0.1.7
perl Makefile.PL
make
cd ..
${THOME}/build/genpkg TRIBlib-perl-5-il-smf Illumos-SMF-0.1.7
