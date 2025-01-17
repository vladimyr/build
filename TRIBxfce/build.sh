#!/bin/sh
#
# I build a single merged package
# as some of the components require prior ones installed,
# the first build will be a multistage process
# where you build the package from the components you have so far
# and then install that incomplete package
# the points at which this is required are noted below 'package step'
#
# it's then best to rebuild the whole lot in one pass
#
# build in a zone; eg
# zap create-zone -z xfce -t whole -i 192.168.0.214 \
# -o xfce -o develop -U ptribble -S /export/packages
#
# 4.16 is gtk3-only
#

$THOME/build/dobuild -gnu tumbler-4.16.0 -C "--disable-debug"
$THOME/build/dobuild -gnu xfce4-dev-tools-4.16.0
$THOME/build/dobuild -gnu libxfce4util-4.16.0 -C "--disable-debug --enable-introspection=no"
# package step?
$THOME/build/dobuild -gnu xfconf-4.16.0 -C "--disable-debug --enable-introspection=no"
# package step
$THOME/build/dobuild -gnu libxfce4ui-4.16.0 -C "--disable-debug --with-vendor-info=Tribblix --enable-introspection=no"
# package step
$THOME/build/dobuild -gnu garcon-4.16.1 -C "--disable-debug"
$THOME/build/dobuild -gnu xfwm4-4.16.1 -C "--disable-debug"
$THOME/build/dobuild -gnu xfce4-session-4.16.0 -C "--disable-debug"
$THOME/build/dobuild -gnu exo-4.16.2 -C "--disable-debug"
# package step
$THOME/build/dobuild -gnu xfce4-settings-4.16.1 -C "--disable-debug"
$THOME/build/dobuild -gnu xfce4-appfinder-4.16.1 -C "--disable-debug"
$THOME/build/dobuild -gnu xfce4-panel-4.16.2 -C "--disable-debug --enable-introspection=no"
$THOME/build/dobuild -gnu xfdesktop-4.16.0 -C "--disable-debug"
$THOME/build/dobuild -gnu thunar-4.16.6 -C "--disable-debug --enable-introspection=no"

$THOME/build/genpkg TRIBxfce tumbler-4.16.0 xfce4-dev-tools-4.16.0 libxfce4util-4.16.0 xfconf-4.16.0 libxfce4ui-4.16.0 garcon-4.16.1 xfwm4-4.16.1 xfce4-session-4.16.0 exo-4.16.2 xfce4-settings-4.16.1 xfce4-appfinder-4.16.1 xfce4-panel-4.16.2 xfdesktop-4.16.0 thunar-4.16.6
