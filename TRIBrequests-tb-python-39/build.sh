#!/bin/sh
#
${THOME}/build/unpack requests-toolbelt-0.9.1
cd requests-toolbelt-0.9.1
/usr/versions/python-3.9/bin/python3 setup.py build
rm -fr /tmp/pil
/usr/versions/python-3.9/bin/python3 setup.py install --root=/tmp/pil
${THOME}/build/create_pkg TRIBrequests-tb-python-39 /tmp/pil
cd ..
rm -fr /tmp/pil
