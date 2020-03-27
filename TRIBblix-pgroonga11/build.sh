#!/bin/sh
#
# this is a postgres extension, so it's specific to the postgres version
#
# requires groonga (obviously) and msgpack-c
#
${THOME}/build/dobuild pgroonga-2.2.5 -M "PG_CONFIG=/opt/tribblix/postgres11/bin/pg_config HAVE_MSGPACK=1"
${THOME}/build/genpkg -I "install PG_CONFIG=/opt/tribblix/postgres11/bin/pg_config HAVE_MSGPACK=1" TRIBblix-pgroonga11 pgroonga-2.2.5
