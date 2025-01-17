#!/bin/tcsh
#
# This is a respin; called 8u275-b01
# the package name isn't updated as it it just a respin
#
# You first need to download the tarballs
# this method from BLFS
#
cd /tmp
wget http://hg.openjdk.java.net/jdk8u/jdk8u/archive/jdk8u272-b10.tar.bz2
foreach file ( corba hotspot jaxp jaxws langtools jdk nashorn )
wget http://hg.openjdk.java.net/jdk8u/jdk8u/${file}/archive/jdk8u272-b10.tar.bz2 -O ${file}-jdk8u272-b10.tar.bz2
end
pbzcat jdk8u272-b10.tar.bz2 | tar xf -
mv jdk8u-jdk8u272-b10 openjdk8u272
foreach file ( corba hotspot jaxp jaxws langtools jdk nashorn )
pbzcat ${file}-jdk8u272-b10.tar.bz2 | tar xf -
mv ${file}-jdk8u272-b10 openjdk8u272/$file
end
tar cf ${THOME}/tarballs/openjdk8u272.tar openjdk8u272
pbzip2 ${THOME}/tarballs/openjdk8u272.tar
#
cd ~/ud
${THOME}/build/unpack openjdk8u272
cd openjdk8u272

#
# alternatively the ga tarball can be obtained from
# https://openjdk-sources.osci.io/openjdk8/openjdk8u275-ga.tar.xz
# ga for 8u272 was b10, it's b01 for the respin
#
cd ~/ud
${THOME}/build/unpack openjdk8u275-ga
cd jdk8u275-ga

#
# the build fails if it finds gobjcopy
# delete it from where it thinks it should be
# and make sure it's not in the PATH
#
# (as root)
#
cd /usr/sfw/bin
rm gobjcopy

#
# a couple of bugfixes that didn't make GA or the respin:
#

#
# this symbol really shouldn't be there
#
sed -i '/Java_jdk_internal_platform_cgroupv1_Metrics_isUseContainerSupport/d' jdk/make/mapfiles/libjava/mapfile-vers

#
# this one is still in the mapfile but no longer appears in the source
# (was in jdk/src/solaris/native/sun/xawt/XToolkit.c)
#
sed -i '/Java_sun_awt_X11_XToolkit_getDefaultScreenData/d' jdk/make/mapfiles/libawt_xawt/mapfile-vers

#
# The fcs is magic to hide the milestone from the version string:
#
env PATH=${HOME}/sunstudio12.1/bin:/usr/bin:/usr/sbin bash ./configure --with-milestone=fcs --with-update-version=275 --with-build-number=b01 --enable-unlimited-crypto
# SPARC requires env HOTSPOT_DISABLE_DTRACE_PROBES=true ...
env PATH=${HOME}/sunstudio12.1/bin:/usr/bin:/usr/sbin gmake all

#
# (as root)
#
cd /usr/sfw/bin
ln -s ../../gnu/bin/objcopy gobjcopy

#
# first testing looks like this:
#
# cd build/solaris-x86_64-normal-server-release/images/j2sdk-image
# ./bin/java -version
# openjdk version "1.8.0_275"
# OpenJDK Runtime Environment (build 1.8.0_275-b01)
# OpenJDK 64-Bit Server VM (build 25.275-b01, mixed mode)
#

#
# need to create a certificate bundle
#
# verify that the TRIBca-bundle package is current and update if necessary
#
# Note that the build creates a cacerts file, but it uses a set of certificates
# from mid-2018, so it's missing many certificates, and some of the certificates
# it has got have expired, so it's of no use to us whatsoever
#
${THOME}/build/patches/mkcacerts -f /etc/openssl/cacert.pem -o /tmp/cacerts -k /usr/jdk/instances/jdk1.8.0/bin/keytool -s /usr/bin/openssl


rm -fr /tmp/jdk
mkdir -p /tmp/jdk/usr/versions/openjdk1.8.0_275
mkdir -p /tmp/jdk/usr/jdk/instances
(cd build/solaris-x86_64-normal-server-release/images/j2sdk-image; tar cf - *) | ( cd /tmp/jdk/usr/versions/openjdk1.8.0_275 ; tar xf -)
cd /tmp/jdk/usr/jdk/instances
ln -s ../../versions/openjdk1.8.0_275 jdk1.8.0
cd /tmp/jdk/usr/jdk
ln -s ../versions/openjdk1.8.0_275 .
ln -s openjdk1.8.0_275 latest
mkdir -p /tmp/jdk/usr/bin
cd /tmp/jdk/usr/bin
ln -s ../jdk/latest/bin/* .
rm -f amd64 sparcv9
cd /tmp/jdk/usr/versions
rm `find . -name '*.diz'`
cp /tmp/cacerts /tmp/jdk/usr/versions/openjdk1.8.0_275/jre/lib/security

#
# edit .../jre/lib/security/sunpkcs11-solaris.cfg and add the following to disabledMechanisms
#
# # the following mechanisms are disabled due to lack of digest cloning support
# # need to fix 6414899 first
#   CKM_MD5
#   CKM_SHA256
#   CKM_SHA384
#   CKM_SHA512
#

${THOME}/build/create_pkg TRIBopenjdk8u272 /tmp/jdk
