#!/bin/sh
#
${THOME}/build/unpack snowballstemmer-1.2.1
cd snowballstemmer-1.2.1
python setup.py build
rm -fr /tmp/pil
python setup.py install --root=/tmp/pil
${THOME}/build/create_pkg TRIBsnowballstemmer-python-27 /tmp/pil
cd ..
rm -fr /tmp/pil