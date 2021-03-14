#!/bin/sh
#
${THOME}/build/unpack detect_secrets-1.0.3
cd detect_secrets-1.0.3
/usr/versions/python-3.9/bin/python3 setup.py build
rm -fr /tmp/pil
/usr/versions/python-3.9/bin/python3 setup.py install --root=/tmp/pil
${THOME}/build/create_pkg TRIBdetect-secrets-python-39 /tmp/pil
cd ..
rm -fr /tmp/pil