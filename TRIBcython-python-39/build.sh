#!/bin/sh
#
${THOME}/build/unpack Cython-0.29.22
cd Cython-0.29.22
/usr/versions/python-3.9/bin/python3 setup.py build
rm -fr /tmp/pil
/usr/versions/python-3.9/bin/python3 setup.py install --root=/tmp/pil
${THOME}/build/create_pkg TRIBcython-python-39 /tmp/pil
cd ..
rm -fr /tmp/pil
