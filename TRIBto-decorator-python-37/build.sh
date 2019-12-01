#!/bin/sh
#
${THOME}/build/unpack timeout-decorator-0.4.1
cd timeout-decorator-0.4.1
/usr/versions/python-3.7/bin/python3 setup.py build
rm -fr /tmp/pil
/usr/versions/python-3.7/bin/python3 setup.py install --root=/tmp/pil
${THOME}/build/create_pkg TRIBto-decorator-python-37 /tmp/pil
cd ..
rm -fr /tmp/pil