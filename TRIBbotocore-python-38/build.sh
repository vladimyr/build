#!/bin/sh
#
${THOME}/build/unpack botocore-1.17.29
cd botocore-1.17.29
/usr/versions/python-3.8/bin/python3 setup.py build
rm -fr /tmp/pdu
/usr/versions/python-3.8/bin/python3 setup.py install --root=/tmp/pdu
${THOME}/build/create_pkg TRIBbotocore-python-38 /tmp/pdu
cd ..
rm -fr /tmp/pdu
