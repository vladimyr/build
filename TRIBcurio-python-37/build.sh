#!/bin/sh
#
${THOME}/build/unpack curio-1.4
cd curio-1.4
/usr/versions/python-3.7/bin/python3 setup.py build
rm -fr /tmp/pil
/usr/versions/python-3.7/bin/python3 setup.py install --root=/tmp/pil
${THOME}/build/create_pkg TRIBcurio-python-37 /tmp/pil
cd ..
rm -fr /tmp/pil
