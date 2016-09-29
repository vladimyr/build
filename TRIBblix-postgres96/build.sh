#!/bin/sh
#
# postgres 9.6
#
${THOME}/build/newbuild.sh build TRIBblix-postgres96
cd postgresql-9.6.0
rm -fr /tmp/pp
gmake install-world DESTDIR=/tmp/pp
${THOME}/build/create_pkg TRIBblix-postgres96 /tmp/pp
rm -fr /tmp/pp
