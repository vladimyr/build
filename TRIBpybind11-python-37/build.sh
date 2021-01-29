#!/bin/sh
#
${THOME}/build/unpack pybind11-2.6.2
cd pybind11-2.6.2
/usr/versions/python-3.7/bin/python3 setup.py build
rm -fr /tmp/pil
/usr/versions/python-3.7/bin/python3 setup.py install --root=/tmp/pil
${THOME}/build/create_pkg TRIBpybind11-python-37 /tmp/pil
cd ..
rm -fr /tmp/pil
