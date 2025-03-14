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

dir=/tmp/zone-edit.$$
mkdir ${dir} || exit 1
trap "/bin/rm -rf ${dir}" 0

prefix=/usr/local
exec_prefix=${prefix}
bindir=${exec_prefix}/bin
sbindir=${exec_prefix}/sbin

dig=${bindir}/dig
checkzone=${sbindir}/named-checkzone
nsupdate=${bindir}/nsupdate

case $# in
0) echo "Usage: zone-edit <zone> [dig options] [ -- nsupdate options ]"; exit 0 ;;
esac

# What kind of echo are we using?
try=`echo -n ""`
if test "X$try" = "X-n "
then
    echo_arg=""
    bsc="\\c"
else
    echo_arg="-n"
    bsc=""
fi

zone="${1}"
shift
digopts=
while test $# -ne 0
do
    case "${1}" in
    --)
	shift
	break
	;;
    *)
	digopts="$digopts $1"
	shift
	;;
    esac
done

${dig} axfr "$zone" $digopts |
awk '$4 == "RRSIG" || $4 == "NSEC" || $4 == "NSEC3" || $4 == "NSEC3PARAM" { next; } { print; }' > ${dir}/old

if test -s ${dir}/old
then
    ${checkzone} -q -D "$zone" ${dir}/old > ${dir}/ooo
fi

if test -s ${dir}/ooo
then
    cp ${dir}/ooo ${dir}/new
    while :
    do
        if ${VISUAL:-${EDITOR:-/bin/ed}} ${dir}/new
        then
	    if ${checkzone} -q -D "$zone" ${dir}/new > ${dir}/nnn
	    then
	        sort ${dir}/ooo > ${dir}/s1 
	        sort ${dir}/nnn > ${dir}/s2 
	        comm -23 ${dir}/s1 ${dir}/s2 |
		sed 's/^/update delete /' > ${dir}/ccc
	        comm -13 ${dir}/s1 ${dir}/s2 |
		sed 's/^/update add /' >> ${dir}/ccc
	        if test -s ${dir}/ccc
	        then
		    cat ${dir}/ccc | more
		    while :
		    do
		        echo ${echo_arg} "Update (u), Abort (a), Redo (r), Modify (m), Display (d) : $bsc"
			read ans
			case "$ans" in
		        u)
			    (
			    echo zone "$zone"
			    cat ${dir}/ccc
			    echo send
			    ) | ${nsupdate} "$@"
			    break 2
			    ;;
			a)
			    break 2
			    ;;
			d)
			    cat ${dir}/ccc | more
			    ;;
			r)
			    cp ${dir}/ooo ${dir}/new
			    break
			    ;;
			m)
			    break
			    ;;
		        esac
		    done
		else
		    while :
		    do 
		        echo ${echo_arg} "Abort (a), Redo (r), Modify (m) : $bsc"
		        read ans
		        case "$ans" in
		        a)
		            break 2
		            ;;
		        r)
		            cp ${dir}/ooo ${dir}/new
		    	    break
		            ;;
		        m)
			    break
		            ;;
		        esac
		    done
	        fi
	    else
		while :
		do 
		    echo ${echo_arg} "Abort (a), Redo (r), Modify (m) : $bsc"
		    read ans
		    case "$ans" in
		    a)
		        break 2
		        ;;
		    r)
		        cp ${dir}/ooo ${dir}/new
		    	break
		        ;;
		    m)
			break
		        ;;
		    esac
		done
	    fi
        fi
    done
fi
