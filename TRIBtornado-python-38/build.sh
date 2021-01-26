#!/bin/sh
#
${THOME}/build/unpack tornado-6.1
cd tornado-6.1
/usr/versions/python-3.8/bin/python3 setup.py build
rm -fr /tmp/pil
/usr/versions/python-3.8/bin/python3 setup.py install --root=/tmp/pil
${THOME}/build/create_pkg TRIBtornado-python-38 /tmp/pil
cd ..
rm -fr /tmp/pil
