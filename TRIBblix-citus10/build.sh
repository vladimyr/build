#!/bin/sh
#
# this is a postgres extension, so it's specific to the postgres version
#
# for 8.2.1 there's a patch for
# https://github.com/citusdata/citus/issues/2679
#
${THOME}/build/dobuild citus-8.2.1 -C PG_CONFIG=/opt/tribblix/postgres10/bin/pg_config
${THOME}/build/genpkg TRIBblix-citus10 citus-8.2.1