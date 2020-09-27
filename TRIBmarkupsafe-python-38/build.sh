#!/bin/sh
#
${THOME}/build/unpack MarkupSafe-1.1.1
cd MarkupSafe-1.1.1
/usr/versions/python-3.8/bin/python3 setup.py build
rm -fr /tmp/pil
/usr/versions/python-3.8/bin/python3 setup.py install --root=/tmp/pil
${THOME}/build/create_pkg TRIBmarkupsafe-python-38 /tmp/pil
cd ..
rm -fr /tmp/pil