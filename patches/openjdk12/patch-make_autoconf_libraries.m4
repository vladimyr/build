$NetBSD$

Support SunOS/gcc.

--- make/autoconf/libraries.m4.orig	2019-01-08 12:44:55.000000000 +0000
+++ make/autoconf/libraries.m4
@@ -192,6 +192,7 @@ AC_DEFUN_ONCE([LIB_SETUP_MISC_LIBS],
 AC_DEFUN_ONCE([LIB_SETUP_SOLARIS_STLPORT],
 [
   if test "$OPENJDK_TARGET_OS" = "solaris" && test "x$BUILD_GTEST" = "xtrue"; then
+   if test "$TOOLCHAIN_TYPE" = "solstudio"; then
     # Find the root of the Solaris Studio installation from the compiler path
     SOLARIS_STUDIO_DIR="$(dirname $CC)/.."
     STLPORT_LIB="$SOLARIS_STUDIO_DIR/lib/stlport4$OPENJDK_TARGET_CPU_ISADIR/libstlport.so.1"
@@ -208,6 +209,7 @@ AC_DEFUN_ONCE([LIB_SETUP_SOLARIS_STLPORT
       AC_MSG_ERROR([Failed to find libstlport.so.1, cannot build Hotspot gtests])
     fi
     AC_SUBST(STLPORT_LIB)
+   fi
   fi
 ])
 
