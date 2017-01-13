#!/bin/sh
#
mkdir w
cd w
env GOPATH=`pwd`go get github.com/chrislusf/seaweedfs/weed
#
rm -fr /tmp/ee
mkdir -p /tmp/ee/opt/tribblix/seaweedfs/bin
cp bin/weed /tmp/ee/opt/tribblix/seaweedfs/bin
cp src/github.com/chrislusf/seaweedfs/README.md /tmp/ee/opt/tribblix/seaweedfs
${THOME}/build/create_pkg TRIBblix-seaweedfs /tmp/ee
rm -fr /tmp/ee
