#!/bin/sh
#
${THOME}/build/unpack filelock-3.0.12
cd filelock-3.0.12
/usr/versions/python-3.9/bin/python3 setup.py build
rm -fr /tmp/pil
/usr/versions/python-3.9/bin/python3 setup.py install --root=/tmp/pil
${THOME}/build/create_pkg TRIBfilelock-python-39 /tmp/pil
cd ..
rm -fr /tmp/pil
