dnl $Id$
dnl config.m4 for extension ybin

dnl Comments in this file start with the string 'dnl'.
dnl Remove where necessary. This file will not work
dnl without editing.

dnl If your extension references something external, use with:

dnl PHP_ARG_WITH(ybin, for ybin support,
dnl Make sure that the comment is aligned:
dnl [  --with-ybin             Include ybin support])

dnl Otherwise use enable:

PHP_ARG_ENABLE(ybin, whether to enable ybin support,
[  --enable-ybin           Enable ybin support])

if test "$PHP_YBIN" != "no"; then
  dnl Write more examples of tests here...

  dnl # get library FOO build options from pkg-config output
  dnl AC_PATH_PROG(PKG_CONFIG, pkg-config, no)
  dnl AC_MSG_CHECKING(for libfoo)
  dnl if test -x "$PKG_CONFIG" && $PKG_CONFIG --exists foo; then
  dnl   if $PKG_CONFIG foo --atleast-version 1.2.3; then
  dnl     LIBFOO_CFLAGS=`$PKG_CONFIG foo --cflags`
  dnl     LIBFOO_LIBDIR=`$PKG_CONFIG foo --libs`
  dnl     LIBFOO_VERSON=`$PKG_CONFIG foo --modversion`
  dnl     AC_MSG_RESULT(from pkgconfig: version $LIBFOO_VERSON)
  dnl   else
  dnl     AC_MSG_ERROR(system libfoo is too old: version 1.2.3 required)
  dnl   fi
  dnl else
  dnl   AC_MSG_ERROR(pkg-config not found)
  dnl fi
  dnl PHP_EVAL_LIBLINE($LIBFOO_LIBDIR, YBIN_SHARED_LIBADD)
  dnl PHP_EVAL_INCLINE($LIBFOO_CFLAGS)

  dnl # --with-ybin -> check with-path
  dnl SEARCH_PATH="/usr/local /usr"     # you might want to change this
  dnl SEARCH_FOR="/include/ybin.h"  # you most likely want to change this
  dnl if test -r $PHP_YBIN/$SEARCH_FOR; then # path given as parameter
  dnl   YBIN_DIR=$PHP_YBIN
  dnl else # search default path list
  dnl   AC_MSG_CHECKING([for ybin files in default path])
  dnl   for i in $SEARCH_PATH ; do
  dnl     if test -r $i/$SEARCH_FOR; then
  dnl       YBIN_DIR=$i
  dnl       AC_MSG_RESULT(found in $i)
  dnl     fi
  dnl   done
  dnl fi
  dnl
  dnl if test -z "$YBIN_DIR"; then
  dnl   AC_MSG_RESULT([not found])
  dnl   AC_MSG_ERROR([Please reinstall the ybin distribution])
  dnl fi

  dnl # --with-ybin -> add include path
  dnl PHP_ADD_INCLUDE($YBIN_DIR/include)

  dnl # --with-ybin -> check for lib and symbol presence
  dnl LIBNAME=ybin # you may want to change this
  dnl LIBSYMBOL=ybin # you most likely want to change this 

  dnl PHP_CHECK_LIBRARY($LIBNAME,$LIBSYMBOL,
  dnl [
  dnl   PHP_ADD_LIBRARY_WITH_PATH($LIBNAME, $YBIN_DIR/$PHP_LIBDIR, YBIN_SHARED_LIBADD)
  dnl   AC_DEFINE(HAVE_YBINLIB,1,[ ])
  dnl ],[
  dnl   AC_MSG_ERROR([wrong ybin lib version or lib not found])
  dnl ],[
  dnl   -L$YBIN_DIR/$PHP_LIBDIR -lm
  dnl ])
  dnl
  dnl PHP_SUBST(YBIN_SHARED_LIBADD)

  PHP_NEW_EXTENSION(ybin, ybin.c, $ext_shared,, -DZEND_ENABLE_STATIC_TSRMLS_CACHE=1)
fi
