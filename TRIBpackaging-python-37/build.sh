#!/bin/sh
#
${THOME}/build/unpack packaging-20.9
cd packaging-20.9
/usr/versions/python-3.7/bin/python3 setup.py build
rm -fr /tmp/pil
/usr/versions/python-3.7/bin/python3 setup.py install --root=/tmp/pil
${THOME}/build/create_pkg TRIBpackaging-python-37 /tmp/pil
cd ..
rm -fr /tmp/pil
