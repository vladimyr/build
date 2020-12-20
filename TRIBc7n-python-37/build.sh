#!/bin/sh
#
${THOME}/build/unpack cloud-custodian-0.9.9.0
cd cloud-custodian-0.9.9.0
/usr/versions/python-3.7/bin/python3 setup.py build
rm -fr /tmp/pil
/usr/versions/python-3.7/bin/python3 setup.py install --root=/tmp/pil
${THOME}/build/create_pkg TRIBc7n-python-37 /tmp/pil
cd ..
rm -fr /tmp/pil
