#!/bin/sh
#
${THOME}/build/unpack reportlab-3.5.55
cd reportlab-3.5.55
/usr/versions/python-3.8/bin/python3 setup.py build
rm -fr /tmp/pil
/usr/versions/python-3.8/bin/python3 setup.py install --root=/tmp/pil
${THOME}/build/create_pkg TRIBreportlab-python-38 /tmp/pil
cd ..
rm -fr /tmp/pil
