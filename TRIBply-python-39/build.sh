#!/bin/sh
#
${THOME}/build/unpack ply-3.11
cd ply-3.11
/usr/versions/python-3.9/bin/python3 setup.py build
rm -fr /tmp/pil
/usr/versions/python-3.9/bin/python3 setup.py install --root=/tmp/pil
${THOME}/build/create_pkg TRIBply-python-39 /tmp/pil
cd ..
rm -fr /tmp/pil
