#!/bin/sh
#
${THOME}/build/unpack httpie-2.4.0
cd httpie-2.4.0
/usr/versions/python-3.9/bin/python3 setup.py build
rm -fr /tmp/pil
/usr/versions/python-3.9/bin/python3 setup.py install --root=/tmp/pil
${THOME}/build/create_pkg TRIBhttpie-python-39 /tmp/pil
cd ..
rm -fr /tmp/pil
