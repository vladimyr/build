#!/bin/sh
#
${THOME}/build/unpack pg_activity-2.1.3
cd pg_activity-2.1.3
/usr/versions/python-3.7/bin/python3 setup.py build
rm -fr /tmp/pil
/usr/versions/python-3.7/bin/python3 setup.py install --root=/tmp/pil --with-man
${THOME}/build/create_pkg TRIBpgactivity /tmp/pil
cd ..
rm -fr /tmp/pil
