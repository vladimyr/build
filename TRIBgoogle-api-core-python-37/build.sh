#!/bin/sh
#
${THOME}/build/unpack google-api-core-1.30.0
cd google-api-core-1.30.0
/usr/versions/python-3.7/bin/python3 setup.py build
rm -fr /tmp/pil
/usr/versions/python-3.7/bin/python3 setup.py install --root=/tmp/pil
${THOME}/build/create_pkg TRIBgoogle-api-core-python-37 /tmp/pil
cd ..
rm -fr /tmp/pil
