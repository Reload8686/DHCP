#!/bin/sh
#
# Copyright (C) Internet Systems Consortium, Inc. ("ISC")
#
# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, you can obtain one at https://mozilla.org/MPL/2.0/.
#
# See the COPYRIGHT file distributed with this work for additional
# information regarding copyright ownership.

prefix=/usr/local
exec_prefix=${prefix}
exec_prefix_set=
includedir=/usr/local/include
libdir=/usr/local/lib

usage()
{
	cat << EOF
Usage: isc-config [OPTIONS] [LIBRARIES]
Options:
	[--prefix[=DIR]]
	[--exec-prefix[=DIR]]
	[--version]
	[--libs]
	[--cflags]
Libraries:
	isc
	isccc
	isccfg
	dns
	lwres
	bind9
	irs
EOF
	exit $1
}

if test $# -eq 0; then
	usage 1 1>&2
fi

while test $# -gt 0; do
	case "$1" in
	-*=*) optarg=`echo "$1" | sed 's/[-_a-zA-Z0-9]*=//'` ;;
	*) optarg= ;;
	esac

	case "$1" in
	--prefix=*)
		prefix=$optarg
		if test "x$exec_prefix_set" = x ; then
			exec_prefix=$prefix
			exec_prefix_set=true
		fi
		;;
	--prefix)
		echo_prefix=true
		;;
	--exec-prefix=*)
		exec_prefix=$optarg
		exec_prefix_set=true
		;;
	--exec-prefix)
		echo_exec_prefix=true
		;;
	--version)
		echo VERSION=9.11.36
		exit 0
		;;
	--cflags)
		echo_cflags=true
		;;
	--libs)
		echo_libs=true;
		;;
	irs)
		libirs=true;
		libdns=true;
		libisccfg=true;
		libisc=true;
		;;
	isc) 
		libisc=true;
		;;
	isccc)
		libisccc=true;
		libisc=true;
		;;
	isccfg)
		libisccfg=true;
		libisc=true;
		;;
	dns)
		libdns=true;
		libisc=true;
		;;
	lwres)
		liblwres=true;
		;;
	bind9)
		libdns=true;
		libisc=true;
		libisccfg=true;
		libbind9=true;
		;;
	*)
		usage 1 1>&2
	esac
	shift
done

if test x"$echo_prefix" = x"true" ; then
	echo $prefix
fi
if test x"$echo_exec_prefix" = x"true" ; then
	echo $exec_prefix
fi
if test x"$echo_cflags" = x"true"; then
	if test x"${exec_prefix_set}" = x"true"; then
		includes="-I${exec_prefix}/include"
	else
		includes="-I${includedir}"
	fi
	if test x"$libisc" = x"true"; then
		includes="$includes    -D_GNU_SOURCE "
	fi
	echo $includes
fi
if test x"$echo_libs" = x"true"; then
	if test x"${exec_prefix_set}" = x"true"; then
		libs="-L${exec_prefix}/lib"
	else
		libs="-L${libdir}"
	fi
	if test x"$libirs" = x"true" ; then
		libs="$libs -lirs"
	fi
	if test x"$liblwres" = x"true" ; then
		libs="$libs -llwres"
	fi
	if test x"$libbind9" = x"true" ; then
		libs="$libs -lbind9"
	fi
	if test x"$libdns" = x"true" ; then
		libs="$libs -ldns "
	fi
	if test x"$libisccfg" = x"true" ; then
		libs="$libs -lisccfg"
	fi
	if test x"$libisccc" = x"true" ; then
		libs="$libs -lisccc"
	fi
	if test x"$libisc" = x"true" ; then
		libs="$libs -lisc "
		needothers=true
	fi
	if test x"$needothers" = x"true" ; then
		libs="$libs  -lz  "
	fi
	echo $libs
fi
