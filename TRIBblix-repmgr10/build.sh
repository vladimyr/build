#!/bin/sh
#
# this is a postgres extension, so it's specific to the postgres version
#
${THOME}/build/dobuild repmgr-4.1.1 -C PG_CONFIG=/opt/tribblix/postgres10/bin/pg_config
${THOME}/build/genpkg TRIBblix-repmgr10 repmgr-4.1.1
