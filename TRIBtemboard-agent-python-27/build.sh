#!/bin/sh
#
${THOME}/build/unpack temboard-agent-3.1
cd temboard-agent-3.1
python setup.py build
rm -fr /tmp/pil
python setup.py install --root=/tmp/pil
${THOME}/build/create_pkg TRIBtemboard-agent-python-27 /tmp/pil
cd ..
rm -fr /tmp/pil
