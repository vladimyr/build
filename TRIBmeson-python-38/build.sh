#!/bin/sh
#
#
#
${THOME}/build/unpack meson-0.56.2
cd meson-0.56.2
rm -fr /tmp/p3a
/usr/versions/python-3.8/bin/python3 setup.py install --root=/tmp/p3a
${THOME}/build/create_pkg TRIBmeson-python-38 /tmp/p3a
cd ..
rm -fr /tmp/p3a