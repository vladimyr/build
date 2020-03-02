#!/bin/sh
#
${THOME}/build/unpack s3transfer-0.3.3
cd s3transfer-0.3.3
python setup.py build
rm -fr /tmp/pdu
python setup.py install --root=/tmp/pdu
${THOME}/build/create_pkg TRIBs3transfer-python-27 /tmp/pdu
cd ..
rm -fr /tmp/pdu
