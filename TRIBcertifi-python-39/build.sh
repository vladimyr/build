#!/bin/sh
#
${THOME}/build/unpack certifi-2020.12.5
cd certifi-2020.12.5
/usr/versions/python-3.9/bin/python3 setup.py build
rm -fr /tmp/pil
/usr/versions/python-3.9/bin/python3 setup.py install --root=/tmp/pil
${THOME}/build/create_pkg TRIBcertifi-python-39 /tmp/pil
cd ..
rm -fr /tmp/pil
