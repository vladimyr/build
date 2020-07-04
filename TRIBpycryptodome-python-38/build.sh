#!/bin/sh
#
${THOME}/build/unpack pycryptodome-3.9.8
cd pycryptodome-3.9.8
/usr/versions/python-3.8/bin/python3 setup.py build
rm -fr /tmp/pil
/usr/versions/python-3.8/bin/python3 setup.py install --root=/tmp/pil
${THOME}/build/create_pkg TRIBpycryptodome-python-38 /tmp/pil
cd ..
rm -fr /tmp/pil
