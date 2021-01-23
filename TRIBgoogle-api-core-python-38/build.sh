#!/bin/sh
#
${THOME}/build/unpack google-api-core-1.24.1
cd google-api-core-1.24.1
/usr/versions/python-3.8/bin/python3 setup.py build
rm -fr /tmp/pil
/usr/versions/python-3.8/bin/python3 setup.py install --root=/tmp/pil
${THOME}/build/create_pkg TRIBgoogle-api-core-python-38 /tmp/pil
cd ..
rm -fr /tmp/pil