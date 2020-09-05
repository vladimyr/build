#!/bin/sh
#
${THOME}/build/unpack asgiref-3.2.10
cd asgiref-3.2.10
/usr/versions/python-3.8/bin/python3 setup.py build
rm -fr /tmp/pil
/usr/versions/python-3.8/bin/python3 setup.py install --root=/tmp/pil
${THOME}/build/create_pkg TRIBasgiref-python-38 /tmp/pil
cd ..
rm -fr /tmp/pil
