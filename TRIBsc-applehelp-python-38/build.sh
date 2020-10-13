#!/bin/sh
#
${THOME}/build/unpack sphinxcontrib-applehelp-1.0.2
cd sphinxcontrib-applehelp-1.0.2
/usr/versions/python-3.8/bin/python3 setup.py build
rm -fr /tmp/pil
/usr/versions/python-3.8/bin/python3 setup.py install --root=/tmp/pil
${THOME}/build/create_pkg TRIBsc-applehelp-python-38 /tmp/pil
cd ..
rm -fr /tmp/pil