#!/bin/sh
#
${THOME}/build/unpack sphinxcontrib-websupport-1.2.4
cd sphinxcontrib-websupport-1.2.4
/usr/versions/python-3.9/bin/python3 setup.py build
rm -fr /tmp/pil
/usr/versions/python-3.9/bin/python3 setup.py install --root=/tmp/pil
${THOME}/build/create_pkg TRIBsphinx-ws-python-39 /tmp/pil
cd ..
rm -fr /tmp/pil
