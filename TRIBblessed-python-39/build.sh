#!/bin/sh
#
${THOME}/build/unpack blessed-1.18.0
cd blessed-1.18.0
/usr/versions/python-3.9/bin/python3 setup.py build
rm -fr /tmp/pil
/usr/versions/python-3.9/bin/python3 setup.py install --root=/tmp/pil
${THOME}/build/create_pkg TRIBblessed-python-39 /tmp/pil
cd ..
rm -fr /tmp/pil
