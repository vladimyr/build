#!/bin/sh
#
${THOME}/build/unpack click-6.7
cd click-6.7
python setup.py build
rm -fr /tmp/pil
python setup.py install --root=/tmp/pil
${THOME}/build/create_pkg TRIBclick-python-27 /tmp/pil
cd ..
rm -fr /tmp/pil
