#!/bin/sh
#
${THOME}/build/unpack certifi-2020.4.5.1
cd certifi-2020.4.5.1
/usr/versions/python-3.8/bin/python3 setup.py build
rm -fr /tmp/pil
/usr/versions/python-3.8/bin/python3 setup.py install --root=/tmp/pil
${THOME}/build/create_pkg TRIBcertifi-python-38 /tmp/pil
cd ..
rm -fr /tmp/pil