#!/bin/sh
#
${THOME}/build/unpack httplib2-0.13.1
cd httplib2-0.13.1
python setup.py build
rm -fr /tmp/pil
python setup.py install --root=/tmp/pil
${THOME}/build/create_pkg TRIBhttplib2-python-27 /tmp/pil
cd ..
rm -fr /tmp/pil
