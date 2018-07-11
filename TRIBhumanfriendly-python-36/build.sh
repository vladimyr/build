#!/bin/sh
#
${THOME}/build/unpack humanfriendly-4.12.1
cd humanfriendly-4.12.1
/usr/versions/python-3.6/bin/python3 setup.py build
rm -fr /tmp/pil
/usr/versions/python-3.6/bin/python3 setup.py install --root=/tmp/pil
${THOME}/build/create_pkg TRIBhumanfriendly-python-36 /tmp/pil
cd ..
rm -fr /tmp/pil