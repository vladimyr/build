#!/bin/tcsh
#
# You first need to download the tarballs
#
# now a single tarball, 80M
#
# initial 12 release:
# wget http://hg.openjdk.java.net/jdk/jdk12/archive/jdk-12+33.tar.bz2
#
cd ${THOME}/tarballs
wget http://hg.openjdk.java.net/jdk-updates/jdk12u/archive/jdk-12.0.1+12.tar.bz2

cd ~/ud
${THOME}/build/unpack jdk-12.0.1+12
cd jdk12u-jdk-12.0.1+12

#
# Unresolved issues:
#
# shenandoah appears to be thoroughly broken
#
# a variety of enums have a trailing , after the last element
#
# shenandoahSharedVariables.hpp - some "value" -> "xxvalue" so
# that some other "value" isn't hidden
#
# other errors aren't so easy to fix, just disable it make/autoconf/hotspot.m4
# looks like dtrace is busted too, I suspect illumos and Solaris have diverged
# enough to trip it up, so --enable-dtrace=no
#

#
# We need a copy of libsoftcrypto.h
# this was formerly shipped with the source, but got removed as the
# build host is supposed to provide it (either as part of the OS
# or via devkit)
#
# removed in
# http://hg.openjdk.java.net/jdk9/jdk9/jdk/rev/9db62c197dcd
# so pull the version from the parent of that commit
#
# http://hg.openjdk.java.net/jdk9/jdk9/jdk/raw-file/48148c98c95a/src/jdk.crypto.ucrypto/solaris/native/libj2ucrypto/libsoftcrypto.h
#
# cp libsoftcrypto.h jdk/src/jdk.crypto.ucrypto/solaris/native/libj2ucrypto
#
cp ${THOME}/build/patches/jdk-libsoftcrypto.h src/jdk.crypto.ucrypto/solaris/native/libj2ucrypto/libsoftcrypto.h

#
# needs objcopy, which is in /usr/gnu/bin
# but the objcopy stuff doesn't actually work
#

#
# jdk12 needs autoconf installed
#
zap install autoconf

#
# jdk10-12 wants Studio 5.13 == Studio 12.4
#

#
# I have no idea what the version string should look like
#

#
# Note for Solaris 10
# src/java.desktop/share/native/libfontmanager/harfbuzz/hb-blob.cc
# the POSIX+C_SOURCE thing is broken - set it to 199506L
#

#
# build on Tribblix m20.5, which has the libc compatibility fixes
#
# cd $HOME
# pbzcat /packages/localsrc/Studio/Studio12.4/SolarisStudio12.4-solaris-x86-bin.tar.bz2 | tar xf -
# mv SolarisStudio12.4-solaris-x86-bin/solarisstudio12.4 .
#
# iropt needs libmmheap.so.1
#
# OK, they're in the Studio12.4 download
# ~/SolarisStudio12.4-solaris-x86-bin/patches/system/120754-14
# SUNWlibmsr/reloc/lib/{,amd64/}libmmheap.so.1
#
# cp libmmheap.so.1 ~/solarisstudio12.4/lib/compilers/sys/
# cp amd64/libmmheap.so.1 ~/solarisstudio12.4/lib/compilers/sys/amd64/
#
# it wants objcopy, hence /usr/sfw/bin in the path
#
# src/hotspot/os/solaris/perfMemory_solaris.cpp
# fix the d_fd error -> dd_fd
#
# src/java.base/solaris/native/libnio/ch/DevPollArrayWrapper.c
# need to #include <signal.h> explicitly
#
# the gobjcopy stuff doesn't actually work, so disable it
# --with-native-debug-symbols=none
#
# shenandoah doesn't build on Solaris x86, or SPARC at all
# so disable it
# --with-jvm-features=-shenandoahgc
#
env PATH=${HOME}/solarisstudio12.4/bin:/usr/bin:/usr/sbin:/usr/sfw/bin bash ./configure --enable-unlimited-crypto --with-boot-jdk=/usr/jdk/instances/jdk11 --with-native-debug-symbols=none --enable-dtrace=no --with-jvm-features=-shenandoahgc
env PATH=${HOME}/solarisstudio12.4/bin:/usr/bin:/usr/sbin:/usr/sfw/bin gmake -k all

#
# there's also a hint about
# --disable-warnings-as-errors
#

#
# first testing looks like this:
#
# cd build/solaris-x86_64-server-release/images/jdk
# ./bin/java -version
# openjdk version "12.0.1-internal" 2019-04-16
# OpenJDK Runtime Environment (build 12.0.1-internal+0-adhoc.ptribble.jdk12u-jdk-12.0.112)
# OpenJDK 64-Bit Server VM (build 12.0.1-internal+0-adhoc.ptribble.jdk12u-jdk-12.0.112, mixed mode, sharing)
#

rm -fr /tmp/jdk
mkdir -p /tmp/jdk/usr/versions/openjdk12
mkdir -p /tmp/jdk/usr/jdk/instances
(cd build/solaris-x86_64-server-release/images/jdk; tar cf - *) | ( cd /tmp/jdk/usr/versions/openjdk12 ; tar xf -)
cd /tmp/jdk/usr/jdk/instances
ln -s ../../versions/openjdk12 jdk12
cd /tmp/jdk/usr/jdk
ln -s ../versions/openjdk12 .
#jdk12 isn't widely supported, so don't make it the default
#ln -s openjdk12 latest
#mkdir -p /tmp/jdk/usr/bin
#cd /tmp/jdk/usr/bin
#ln -s ../jdk/latest/bin/* .
#rm amd64
cd /tmp/jdk/usr/versions/openjdk12
rm `find . -name '*.diz'`

#
# need to create a certificate bundle
#
# the jdk12 build appears to create a working one, so leave it be
#
# this actually needs to be a JKS keystore, not a PKCS12 keystore
# https://bugs.launchpad.net/ubuntu/+source/ca-certificates-java/+bug/1739631
#
#${THOME}/build/patches/mkcacerts -f /etc/openssl/cacert.pem -o /tmp/cacerts -k /usr/jdk/instances/jdk1.8.0/bin/keytool -s /usr/bin/openssl
#
#cp /tmp/cacerts /tmp/jdk/usr/versions/openjdk12/lib/security

#
# edit conf/security/sunpkcs11-solaris.cfg and add the following to disabledMechanisms
#
# again, doesn't seem to be necessary
#
# # the following mechanisms are disabled due to lack of digest cloning support
# # need to fix 6414899 first
#   CKM_MD5
#   CKM_SHA256
#   CKM_SHA384
#   CKM_SHA512
#

${THOME}/build/create_pkg TRIBopenjdk12 /tmp/jdk
