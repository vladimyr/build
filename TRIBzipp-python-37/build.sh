#!/bin/sh
#
${THOME}/build/unpack zipp-3.4.1
cd zipp-3.4.1
/usr/versions/python-3.7/bin/python3 setup.py build
rm -fr /tmp/pil
/usr/versions/python-3.7/bin/python3 setup.py install --root=/tmp/pil
${THOME}/build/create_pkg TRIBzipp-python-37 /tmp/pil
cd ..
rm -fr /tmp/pil
