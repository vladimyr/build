#!/bin/sh
#
${THOME}/build/unpack mcross-0.5.19
cd mcross-0.5.19
/usr/versions/python-3.8/bin/python3 setup.py build
rm -fr /tmp/pil
/usr/versions/python-3.8/bin/python3 setup.py install --root=/tmp/pil
${THOME}/build/create_pkg TRIBmcross-python-38 /tmp/pil
cd ..
rm -fr /tmp/pil
