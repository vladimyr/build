#!/bin/sh
#
${THOME}/build/unpack sphinxcontrib-serializinghtml-1.1.4
cd sphinxcontrib-serializinghtml-1.1.4
/usr/versions/python-3.8/bin/python3 setup.py build
rm -fr /tmp/pil
/usr/versions/python-3.8/bin/python3 setup.py install --root=/tmp/pil
${THOME}/build/create_pkg TRIBsc-serhtml-python-38 /tmp/pil
cd ..
rm -fr /tmp/pil