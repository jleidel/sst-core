AC_DEFUN([SST_CHECK_METIS],
[
  sst_check_metis_happy="yes"
  sst_check_metis_requested="yes"

  AC_ARG_WITH([metis],
    [AS_HELP_STRING([--with-metis@<:@=DIR@:>@],
      [Use METIS package installed in optionally specified DIR])],
    [sst_check_metis_requested="yes"],
    [sst_check_metis_requested="no"])

  AS_IF([test "$with_metis" = "no"], [sst_check_metis_happy="no"])

  CPPFLAGS_saved="$CPPFLAGS"
  LDFLAGS_saved="$LDFLAGS"

  AS_IF([test "$sst_check_metis_happy" = "yes"], [
    AS_IF([test ! -z "$with_metis" -a "$with_metis" != "yes"],
      [METIS_CPPFLAGS="-I$with_metis/include"
       CPPFLAGS="$METIS_CPPFLAGS $CPPFLAGS"
       METIS_LDFLAGS="-L$with_metis/lib"
       LDFLAGS="$METIS_LDFLAGS $LDFLAGS -lm"],
      [METIS_CPPFLAGS=
       METIS_LDFLAGS=])

    AC_CHECK_HEADERS([metis.h], [], [sst_check_metis_happy="no"])
    AC_CHECK_LIB([metis], [libmetis__InitKWayPartitioning], 
      [METIS_LIB="-lmetis"], [sst_check_metis_happy="no"], [$METIS_LIB])])

  CPPFLAGS="$CPPFLAGS_saved"
  LDFLAGS="$LDFLAGS_saved"

  AC_SUBST([METIS_CPPFLAGS])
  AC_SUBST([METIS_LDFLAGS])
  AC_SUBST([METIS_LIB])

  AC_MSG_CHECKING([for METIS partitioning library])
  AC_MSG_RESULT([$sst_check_metis_happy])

  # if user doesn't specify --with-metis then string is empty, otherwise is has a value
  # if the value is not "no" then we treat as a path, and MUST find in order to be
  # successful
  AS_IF([test "x$sst_check_metis_requested" = "xyes" -a "x$sst_check_metis_happy" != "xyes"],
	[AC_MSG_FAILURE([METIS was requested by configure (--with-metis=$with_metis) but the required libraries and header files could not be found.])])
  AS_IF([test "$sst_check_metis_happy" = "yes"], [$1], [$2])
])
