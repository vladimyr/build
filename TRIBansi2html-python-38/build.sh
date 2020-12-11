#!/bin/sh
#
${THOME}/build/unpack ansi2html-1.6.0
cd ansi2html-1.6.0
/usr/versions/python-3.8/bin/python3 setup.py build
rm -fr /tmp/pil
/usr/versions/python-3.8/bin/python3 setup.py install --root=/tmp/pil
${THOME}/build/create_pkg TRIBansi2html-python-38 /tmp/pil
cd ..
rm -fr /tmp/pil
