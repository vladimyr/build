#!/bin/sh
#
${THOME}/build/unpack asciinema-2.0.2
cd asciinema-2.0.2
/usr/versions/python-3.7/bin/python3 setup.py build
rm -fr /tmp/pil
/usr/versions/python-3.7/bin/python3 setup.py install --root=/tmp/pil
${THOME}/build/create_pkg TRIBasciinema-python-37 /tmp/pil
cd ..
rm -fr /tmp/pil