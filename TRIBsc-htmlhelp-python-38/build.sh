#!/bin/sh
#
${THOME}/build/unpack sphinxcontrib-htmlhelp-1.0.3
cd sphinxcontrib-htmlhelp-1.0.3
/usr/versions/python-3.8/bin/python3 setup.py build
rm -fr /tmp/pil
/usr/versions/python-3.8/bin/python3 setup.py install --root=/tmp/pil
${THOME}/build/create_pkg TRIBsc-htmlhelp-python-38 /tmp/pil
cd ..
rm -fr /tmp/pil
