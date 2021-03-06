#!/bin/sh

#AM_VERSION="1.11"
if ! type aclocal-$AM_VERSION 1>/dev/null 2>&1; then
	AUTOMAKE=automake
	ACLOCAL=aclocal
else
	ACLOCAL=aclocal-${AM_VERSION}
	AUTOMAKE=automake-${AM_VERSION}
fi

if test -f /usr/local/bin/glibtoolize ; then
	# darwin
	LIBTOOLIZE=/usr/local/bin/glibtoolize
else
	LIBTOOLIZE=libtoolize
fi
if test -d /usr/local/share/aclocal ; then
	ACLOCAL_ARGS="-I /usr/local/share/aclocal"
fi

echo "Generating build scripts for G729 codec..."
set -x
$LIBTOOLIZE --copy --force
$ACLOCAL  $ACLOCAL_ARGS
#autoheader
$AUTOMAKE --force-missing --add-missing --copy
autoconf

