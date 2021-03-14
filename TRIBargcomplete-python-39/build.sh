#!/bin/sh
#
${THOME}/build/unpack argcomplete-1.12.2
cd argcomplete-1.12.2
/usr/versions/python-3.9/bin/python3 setup.py build
rm -fr /tmp/pil
/usr/versions/python-3.9/bin/python3 setup.py install --root=/tmp/pil
${THOME}/build/create_pkg TRIBargcomplete-python-39 /tmp/pil
cd ..
rm -fr /tmp/pil