#!/bin/sh
#
# [needs a postconf patch]
#
${THOME}/build/dobuild -64 curl-7.52.1 -C "--with-ca-bundle=/etc/openssl/cacert.pem"
${THOME}/build/genpkg TRIBcurl curl-7.52.1
