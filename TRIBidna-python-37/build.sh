#!/bin/sh
#
${THOME}/build/unpack idna-3.1
cd idna-3.1
/usr/versions/python-3.7/bin/python3 setup.py build
rm -fr /tmp/pil
/usr/versions/python-3.7/bin/python3 setup.py install --root=/tmp/pil
${THOME}/build/create_pkg TRIBidna-python-37 /tmp/pil
cd ..
rm -fr /tmp/pil
