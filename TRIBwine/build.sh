#!/bin/sh
#
# wine
#
env PATH=/usr/gnu/bin:$PATH ${THOME}/build/dobuild -gnu wine-1.8.7
env PATH=/usr/gnu/bin:$PATH ${THOME}/build/genpkg TRIBwine wine-1.8.7
