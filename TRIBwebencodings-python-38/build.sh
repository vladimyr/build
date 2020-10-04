#!/bin/sh
#
${THOME}/build/unpack webencodings-0.5.1
cd webencodings-0.5.1
/usr/versions/python-3.8/bin/python3 setup.py build
rm -fr /tmp/pil
/usr/versions/python-3.8/bin/python3 setup.py install --root=/tmp/pil
${THOME}/build/create_pkg TRIBwebencodings-python-38 /tmp/pil
cd ..
rm -fr /tmp/pil
