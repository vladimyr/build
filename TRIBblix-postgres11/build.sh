#!/bin/sh
#
# postgres 11
#
${THOME}/build/dobuild -P /opt/tribblix/postgres11 postgresql-11.2 -C "--without-readline --with-perl" -M world
${THOME}/build/genpkg -I install-world TRIBblix-postgres11 postgresql-11.2
