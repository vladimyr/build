#!/bin/sh
#
${THOME}/build/unpack certifi-2020.6.20
cd certifi-2020.6.20
/usr/versions/python-3.7/bin/python3 setup.py build
rm -fr /tmp/pil
/usr/versions/python-3.7/bin/python3 setup.py install --root=/tmp/pil
${THOME}/build/create_pkg TRIBcertifi-python-37 /tmp/pil
cd ..
rm -fr /tmp/pil
