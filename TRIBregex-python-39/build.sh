#!/bin/sh
#
${THOME}/build/unpack regex-2020.11.13
cd regex-2020.11.13
/usr/versions/python-3.9/bin/python3 setup.py build
rm -fr /tmp/pil
/usr/versions/python-3.9/bin/python3 setup.py install --root=/tmp/pil
${THOME}/build/create_pkg TRIBregex-python-39 /tmp/pil
cd ..
rm -fr /tmp/pil
