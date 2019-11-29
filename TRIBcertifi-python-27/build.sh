#!/bin/sh
#
${THOME}/build/unpack certifi-2019.11.28
cd certifi-2019.11.28
python setup.py build
rm -fr /tmp/pil
python setup.py install --root=/tmp/pil
${THOME}/build/create_pkg TRIBcertifi-python-27 /tmp/pil
cd ..
rm -fr /tmp/pil
