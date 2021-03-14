#!/bin/sh
#
${THOME}/build/unpack psycopg2-2.8.6
cd psycopg2-2.8.6
env PATH=/opt/tribblix/postgres13/bin:$PATH LD_RUN_PATH=/opt/tribblix/postgres13/lib /usr/versions/python-3.8/bin/python3 setup.py build
rm -fr /tmp/pil
env PATH=/opt/tribblix/postgres13/bin:$PATH LD_RUN_PATH=/opt/tribblix/postgres13/lib /usr/versions/python-3.8/bin/python3 setup.py install --root=/tmp/pil
${THOME}/build/create_pkg TRIBpsycopg2-38 /tmp/pil
cd ..
rm -fr /tmp/pil