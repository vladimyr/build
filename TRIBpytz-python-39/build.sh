#!/bin/sh
#
${THOME}/build/unpack pytz-2021.1
cd pytz-2021.1
/usr/versions/python-3.9/bin/python3 setup.py build
rm -fr /tmp/pil
/usr/versions/python-3.9/bin/python3 setup.py install --root=/tmp/pil
${THOME}/build/create_pkg TRIBpytz-python-39 /tmp/pil
cd ..
rm -fr /tmp/pil
