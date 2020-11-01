#!/bin/sh
#
${THOME}/build/unpack appdirs-1.4.4
cd appdirs-1.4.4
/usr/versions/python-3.7/bin/python3 setup.py build
rm -fr /tmp/pil
/usr/versions/python-3.7/bin/python3 setup.py install --root=/tmp/pil
${THOME}/build/create_pkg TRIBappdirs-python-37 /tmp/pil
cd ..
rm -fr /tmp/pil