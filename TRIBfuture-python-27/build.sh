#!/bin/sh
#
${THOME}/build/unpack future-0.17.1
cd future-0.17.1
python setup.py build
rm -fr /tmp/pil
python setup.py install --root=/tmp/pil
${THOME}/build/create_pkg TRIBfuture-python-27 /tmp/pil
cd ..
rm -fr /tmp/pil
