#!/bin/sh
#
${THOME}/build/unpack reportlab-3.5.67
cd reportlab-3.5.67
/usr/versions/python-3.7/bin/python3 setup.py build
rm -fr /tmp/pil
/usr/versions/python-3.7/bin/python3 setup.py install --root=/tmp/pil
${THOME}/build/create_pkg TRIBreportlab-python-37 /tmp/pil
cd ..
rm -fr /tmp/pil
