#!/bin/sh
#
${THOME}/build/unpack borgbackup-1.1.14
cd borgbackup-1.1.14
/usr/versions/python-3.8/bin/python3 setup.py build
rm -fr /tmp/pil
/usr/versions/python-3.8/bin/python3 setup.py install --root=/tmp/pil
${THOME}/build/create_pkg TRIBborg-python-38 /tmp/pil
cd ..
rm -fr /tmp/pil