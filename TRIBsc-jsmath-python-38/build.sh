#!/bin/sh
#
${THOME}/build/unpack sphinxcontrib-jsmath-1.0.1
cd sphinxcontrib-jsmath-1.0.1
/usr/versions/python-3.8/bin/python3 setup.py build
rm -fr /tmp/pil
/usr/versions/python-3.8/bin/python3 setup.py install --root=/tmp/pil
${THOME}/build/create_pkg TRIBsc-jsmath-python-38 /tmp/pil
cd ..
rm -fr /tmp/pil