#!/bin/sh
#
# this is a postgres extension, so it's specific to the postgres version
#
${THOME}/build/dobuild citus-9.2.4 -C PG_CONFIG=/opt/tribblix/postgres12/bin/pg_config
${THOME}/build/genpkg TRIBblix-citus12 citus-9.2.4
