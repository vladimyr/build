#!/bin/sh
#
${THOME}/build/unpack html2text-2020.1.16
cd html2text-2020.1.16
/usr/versions/python-3.9/bin/python3 setup.py build
rm -fr /tmp/pil
/usr/versions/python-3.9/bin/python3 setup.py install --root=/tmp/pil
${THOME}/build/create_pkg TRIBhtml2text-python-39 /tmp/pil
cd ..
rm -fr /tmp/pil
