#!/bin/sh
#
${THOME}/build/unpack ConfigArgParse-1.3
cd ConfigArgParse-1.3
/usr/versions/python-3.8/bin/python3 setup.py build
rm -fr /tmp/pil
/usr/versions/python-3.8/bin/python3 setup.py install --root=/tmp/pil
${THOME}/build/create_pkg TRIBconfigargparse-python-38 /tmp/pil
cd ..
rm -fr /tmp/pil
