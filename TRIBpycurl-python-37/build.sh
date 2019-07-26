#!/bin/sh
#
${THOME}/build/unpack pycurl-7.43.0.3
cd pycurl-7.43.0.3
/usr/versions/python-3.7/bin/python3 setup.py build
rm -fr /tmp/pil
/usr/versions/python-3.7/bin/python3 setup.py install --root=/tmp/pil
${THOME}/build/create_pkg TRIBpycurl-python-37 /tmp/pil
cd ..
rm -fr /tmp/pil
