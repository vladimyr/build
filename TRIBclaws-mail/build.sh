#!/bin/sh
#
zap uninstall TRIBlibcanberra
${THOME}/build/dobuild claws-mail-3.16.0 -C --disable-ldap
${THOME}/build/genpkg TRIBclaws-mail claws-mail-3.16.0
