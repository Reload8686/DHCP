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

#
# Common configuration data for system tests, to be sourced into
# other shell scripts.
#

# Find the top of the BIND9 tree.
TOP=/home/rener/dhcp-4.4.3-P1/bind/bind-9.11.36

# Default algorithm for testing
DEFAULT_ALGORITHM=RSASHA256
DEFAULT_ALGORITHM_NUMBER=8
DEFAULT_BITS=1280

# Provide TMPDIR variable for tests that need it.
TMPDIR=${TMPDIR:-/tmp}

# must be different from DEFAULT_ALGORITHM
ALTERNATIVE_ALGORITHM=RSASHA1
ALTERNATIVE_ALGORITHM_NUMBER=5
ALTERNATIVE_BITS=1280

# This is an algorithm that is used for tests against the
# "disable-algorithms" configuration option.  Must be different from above
# algorithms.
DISABLED_ALGORITHM=ECDSAP384SHA384
DISABLED_ALGORITHM_NUMBER=14
DISABLED_BITS=384

NAMED=$TOP/bin/named/named
# We must use "named -l" instead of "lwresd" because argv[0] is lost
# if the program is libtoolized.
LWRESD="$TOP/bin/named/named -l"
DIG=$TOP/bin/dig/dig
DELV=$TOP/bin/delv/delv
RNDC=$TOP/bin/rndc/rndc
NSUPDATE=$TOP/bin/nsupdate/nsupdate
DDNSCONFGEN=$TOP/bin/confgen/ddns-confgen
TSIGKEYGEN=$TOP/bin/confgen/tsig-keygen
RNDCCONFGEN=$TOP/bin/confgen/rndc-confgen
KEYGEN=$TOP/bin/dnssec/dnssec-keygen
KEYFRLAB=$TOP/bin/dnssec/dnssec-keyfromlabel
SIGNER=$TOP/bin/dnssec/dnssec-signzone
REVOKE=$TOP/bin/dnssec/dnssec-revoke
SETTIME=$TOP/bin/dnssec/dnssec-settime
DSFROMKEY=$TOP/bin/dnssec/dnssec-dsfromkey
HOST=$TOP/bin/dig/host
IMPORTKEY=$TOP/bin/dnssec/dnssec-importkey
CHECKDS=$TOP/bin/python/dnssec-checkds
COVERAGE=$TOP/bin/python/dnssec-coverage
KEYMGR=$TOP/bin/python/dnssec-keymgr
CHECKZONE=$TOP/bin/check/named-checkzone
CHECKCONF=$TOP/bin/check/named-checkconf
PK11GEN="$TOP/bin/pkcs11/pkcs11-keygen -q -s ${SLOT:-0} -p ${HSMPIN:-1234}"
PK11LIST="$TOP/bin/pkcs11/pkcs11-list -s ${SLOT:-0} -p ${HSMPIN:-1234}"
PK11DEL="$TOP/bin/pkcs11/pkcs11-destroy -s ${SLOT:-0} -p ${HSMPIN:-1234} -w 0"
JOURNALPRINT=$TOP/bin/tools/named-journalprint
VERIFY=$TOP/bin/dnssec/dnssec-verify
ARPANAME=$TOP/bin/tools/arpaname
RESOLVE=$TOP/lib/samples/resolve
RRCHECKER=$TOP/bin/tools/named-rrchecker
GENRANDOM=$TOP/bin/tools/genrandom
NSLOOKUP=$TOP/bin/dig/nslookup
DNSTAPREAD=$TOP/bin/tools/dnstap-read
MDIG=$TOP/bin/tools/mdig
NZD2NZF=$TOP/bin/tools/named-nzd2nzf
FSTRM_CAPTURE=
FEATURETEST=$TOP/bin/tests/system/feature-test

RANDFILE=$TOP/bin/tests/system/random.data

BIGKEY=$TOP/bin/tests/system/rsabigexponent/bigkey
GENCHECK=$TOP/bin/tests/system/rndc/gencheck
KEYCREATE=$TOP/bin/tests/system/tkey/keycreate
KEYDELETE=$TOP/bin/tests/system/tkey/keydelete
LWTEST=$TOP/bin/tests/system/lwresd/lwtest
MAKEJOURNAL=$TOP/bin/tests/makejournal
PIPEQUERIES=$TOP/bin/tests/system/pipelined/pipequeries
SAMPLEUPDATE=$TOP/lib/samples/sample-update

# we don't want a KRB5_CONFIG setting breaking the tests
KRB5_CONFIG=/dev/null
# use local keytab instead of default /etc/krb5.keytab
KRB5_KTNAME=dns.keytab

# the amount of fake "entropy" to generate with GENRANDOM in
# system tests
RANDOMSIZE=4096

# The "stress" test is not run by default since it creates enough
# load on the machine to make it unusable to other users.
# The "dialup", "delzone", and "dupsigs" tests are also not run by
# default because they take a very long time to complete.
#
# List of tests hard-coded to use ports 5300 and 9953. For this
# reason, these must be run sequentially.
SEQUENTIALDIRS="ecdsa eddsa gost lwresd  tkey"

# List of tests that use ports assigned by caller (other than 5300
# and 9953). Because separate blocks of ports can be used for teach
# test, these tests can be run in parallel.
#
# Note: some of the longer-running tests are scheduled first,
# in order to get more benefit from parallelism.
PARALLELDIRS="dnssec rpzrecurse \
	acl additional addzone allow-query auth autosign \
	builtin cacheclean case catz chain \
	checkconf checknames checkzone \
	   \
	cookie database digdelv dlv dlz dlzexternal \
	dns64  dscp dsdigest dyndb \
	ednscompliance emptyzones \
	fetchlimit filter-aaaa formerr forward \
	geoip geoip2 glue idna inline integrity ixfr \
	legacy limits logfileconfig \
	masterfile masterformat metadata mkeys \
	names notify nslookup nsupdate nzd2nzf \
	pending pipelined \
	reclimit redirect resolver rndc rootkeysentinel rpz \
	rrchecker rrl rrsetorder rsabigexponent runtime \
	sfcache smartsign sortlist \
	spf staticstub statistics statschannel stub \
	tcp tsig tsiggss \
	unknown upforwd verify views wildcard \
	xfer xferquota zero zonechecks"

SUBDIRS="$SEQUENTIALDIRS $PARALLELDIRS"

# Things that are different on Windows
KILL=kill
DIFF=diff
DOS2UNIX=true
# There's no trailing period on Windows
TP=.

# Use the CONFIG_SHELL detected by configure for tests
SHELL=/bin/bash

# CURL will be empty if no program was found by configure
CURL=/usr/bin/curl

# XMLLINT will be empty if no program was found by configure
XMLLINT=/usr/bin/xmllint

# XSLTPROC will be empty if no program was found by configure
XSLTPROC=/usr/bin/xsltproc

# PERL will be an empty string if no perl interpreter was found.
PERL=/usr/bin/perl

testsock6() {
	if test -n "$PERL" \
		&& $PERL -e "use IO::Socket::INET6;" 2> /dev/null \
		&& grep "^#define WANT_IPV6 1" "$TOP/config.h" > /dev/null 2>&1
	then
		$PERL "$TOP/bin/tests/system/testsock6.pl" "$@"
	else
		false
	fi
}

# Windows process management leave empty
PSSUSPEND=

PYTHON=

#
# Determine if we support various optional features.
#
CHECK_DSA=0
HAVEXMLSTATS=
HAVEJSONSTATS=
ZLIB=1
NZD=

. ${TOP}/version

#
# Set up color-coded test output
#
if [ ${SYSTEMTEST_FORCE_COLOR:-0} -eq 1 ] || test -t 1 && type tput > /dev/null 2>&1 && tput setaf 7 > /dev/null 2>&1 ; then
    COLOR_END=`tput setaf 4`    # blue
    COLOR_FAIL=`tput setaf 1`   # red
    COLOR_INFO=`tput bold`      # bold
    COLOR_NONE=`tput sgr0`
    COLOR_PASS=`tput setaf 2`   # green
    COLOR_START=`tput setaf 4`  # blue
    COLOR_WARN=`tput setaf 3`   # yellow
else
    # set to empty strings so printf succeeds
    COLOR_END=''
    COLOR_FAIL=''
    COLOR_INFO=''
    COLOR_NONE=''
    COLOR_PASS=''
    COLOR_START=''
    COLOR_WARN=''
fi

SYSTESTDIR="`basename $PWD`"

if type printf > /dev/null 2>&1
then
	echofail () {
		printf "${COLOR_FAIL}%s${COLOR_NONE}\n" "$*"
	}
	echowarn () {
		printf "${COLOR_WARN}%s${COLOR_NONE}\n" "$*"
	}
	echopass () {
		printf "${COLOR_PASS}%s${COLOR_NONE}\n" "$*"
	}
	echoinfo () {
		printf "${COLOR_INFO}%s${COLOR_NONE}\n" "$*"
	}
	echostart () {
		printf "${COLOR_START}%s${COLOR_NONE}\n" "$*"
	}
	echoend () {
		printf "${COLOR_END}%s${COLOR_NONE}\n" "$*"
	}
	echo_i() {
	    printf '%s\n' "$*" | while read -r __LINE ; do
	       echoinfo "I:$SYSTESTDIR:$__LINE"
	    done
	}

	echo_ic() {
	    printf '%s\n' "$*" | while read -r __LINE ; do
	       echoinfo "I:$SYSTESTDIR:  $__LINE"
	    done
	}

	echo_d() {
	    printf '%s\n' "$*" | while read -r __LINE ; do
	       echoinfo "D:$SYSTESTDIR:$__LINE"
	    done
	}
else
	echofail () {
		echo "$*"
	}
	echowarn () {
		echo "$*"
	}
	echopass () {
		echo "$*"
	}
	echoinfo () {
		echo "$*"
	}
	echostart () {
		echo "$*"
	}
	echoend () {
		echo "$*"
	}

	echo_i() {
	    echo "$@" | while read -r __LINE ; do
	       echoinfo "I:$SYSTESTDIR:$__LINE"
	    done
	}

	echo_ic() {
	    echo "$@" | while read -r __LINE ; do
	       echoinfo "I:$SYSTESTDIR:  $__LINE"
	    done
	}

	echo_d() {
	    echo "$@" | while read -r __LINE ; do
	       echoinfo "D:$SYSTESTDIR:$__LINE"
	    done
	}
fi

cat_i() {
    while read -r __LINE ; do
       echoinfo "I:$SYSTESTDIR:$__LINE"
    done
}

cat_d() {
    while read -r __LINE ; do
       echoinfo "D:$SYSTESTDIR:$__LINE"
    done
}


digcomp() {
    output=`$PERL $SYSTEMTESTTOP/digcomp.pl "$@"`
    result=$?
    [ -n "$output" ] &&  { echo "digcomp failed:"; echo "$output"; } | cat_i
    return $result
}

#
# Useful functions in test scripts
#

# assert_int_equal: compare two integer variables, $1 and $2
#
# If $1 and $2 are equal, return 0; if $1 and $2 are not equal, report
# the error using the description of the tested variable provided in $3
# and return 1.
assert_int_equal() {
	found="$1"
	expected="$2"
	description="$3"

	if [ "${expected}" -ne "${found}" ]; then
		echo_i "incorrect ${description}: got ${found}, expected ${expected}"
		return 1
	fi

	return 0
}

# keyfile_to_keys_section: helper function for keyfile_to_*_keys() which
# converts keyfile data into a configuration section using the supplied
# parameters
keyfile_to_keys_section() {
    section_name=$1
    key_prefix=$2
    shift
    shift
    echo "$section_name {"
    for keyname in $*; do
	awk '!/^; /{
	    printf "\t\""$1"\" "
	    printf "'"$key_prefix"'"
	    printf $4 " " $5 " " $6 " \""
	    for (i=7; i<=NF; i++) printf $i
	    printf "\";\n"
	}' $keyname.key
    done
    echo "};"
}

# keyfile_to_trusted_keys: convert key data contained in the keyfile(s)
# provided to a "trusted-keys" section suitable for including in a
# resolver's configuration file
keyfile_to_trusted_keys() {
    keyfile_to_keys_section "trusted-keys" "" $*
}

# keyfile_to_managed_keys: convert key data contained in the keyfile(s)
# provided to a "managed-keys" section suitable for including in a
# resolver's configuration file
keyfile_to_managed_keys() {
    keyfile_to_keys_section "managed-keys" "initial-key " $*
}

# keyfile_to_key_id: convert a key file name to a key ID
#
# For a given key file name (e.g. "Kexample.+013+06160") provided as $1,
# print the key ID with leading zeros stripped ("6160" for the
# aforementioned example).
keyfile_to_key_id() {
	echo "$1" | sed "s/.*+0\{0,4\}//"
}

# nextpart*() - functions for reading files incrementally
#
# These functions aim to facilitate looking for (or waiting for)
# messages which may be logged more than once throughout the lifetime of
# a given named instance by outputting just the part of the file which
# has been appended since the last time we read it.
#
# Calling some of these functions causes temporary *.prev files to be
# created that need to be cleaned up manually (usually by a given system
# test's clean.sh script).
#
# Note that unlike other nextpart*() functions, nextpartread() is not
# meant to be directly used in system tests; its sole purpose is to
# reduce code duplication below.
#
# A quick usage example:
#
#     $ echo line1 > named.log
#     $ echo line2 >> named.log
#     $ nextpart named.log
#     line1
#     line2
#     $ echo line3 >> named.log
#     $ nextpart named.log
#     line3
#     $ nextpart named.log
#     $ echo line4 >> named.log
#     $ nextpartpeek named.log
#     line4
#     $ nextpartpeek named.log
#     line4
#     $ nextpartreset named.log
#     $ nextpartpeek named.log
#     line1
#     line2
#     line3
#     line4
#     $ nextpart named.log
#     line1
#     line2
#     line3
#     line4
#     $ nextpart named.log
#     $

# nextpartreset: reset the marker used by nextpart() and nextpartpeek()
# so that it points to the start of the given file
nextpartreset() {
    echo "0" > $1.prev
}

# nextpartread: read everything that's been appended to a file since the
# last time nextpart() was called and print it to stdout, print the
# total number of lines read from that file so far to stderr
nextpartread() {
    [ -f $1.prev ] || nextpartreset $1
    prev=`cat $1.prev`
    awk "NR > $prev "'{ print }
         END          { print NR > "/dev/stderr" }' $1
}

# nextpart: read everything that's been appended to a file since the
# last time nextpart() was called
nextpart() {
	nextpartread $1 2> $1.prev.tmp
	mv $1.prev.tmp $1.prev
}

# nextpartpeek: read everything that's been appended to a file since the
# last time nextpart() was called
nextpartpeek() {
	nextpartread $1 2> /dev/null
}

# _search_log: look for message $1 in file $2 with nextpart().
_search_log() (
	msg="$1"
	file="$2"
	nextpart "$file" | grep -F "$msg" > /dev/null
)

# _search_log_peek: look for message $1 in file $2 with nextpartpeek().
_search_log_peek() (
	msg="$1"
	file="$2"
	nextpartpeek "$file" | grep -F "$msg" > /dev/null
)

# wait_for_log: wait until message $2 in file $3 appears.  Bail out after
# $1 seconds.  This needs to be used in conjunction with a prior call to
# nextpart() or nextpartreset() on the same file to guarantee the offset is
# set correctly.  Tests using wait_for_log() are responsible for cleaning up
# the created <file>.prev files.
wait_for_log() (
	timeout="$1"
	msg="$2"
	file="$3"
	retry_quiet "$timeout" _search_log "$msg" "$file" && return 0
	echo_i "exceeded time limit waiting for '$msg' in $file"
        return 1
)

# wait_for_log_peek: similar to wait_for_log() but peeking, so the file offset
# does not change.
wait_for_log_peek() (
	timeout="$1"
	msg="$2"
	file="$3"
	retry_quiet "$timeout" _search_log_peek "$msg" "$file" && return 0
	echo_i "exceeded time limit waiting for '$msg' in $file"
        return 1
)

# _retry: keep running a command until it succeeds, up to $1 times, with
# one-second intervals, optionally printing a message upon every attempt
_retry() {
	__retries="${1}"
	shift

	while :; do
		if "$@"; then
			return 0
		fi
		__retries=$((__retries-1))
		if [ "${__retries}" -gt 0 ]; then
			if [ "${__retry_quiet}" -ne 1 ]; then
				echo_i "retrying"
			fi
			sleep 1
		else
			return 1
		fi
	done
}

# retry: call _retry() in verbose mode
retry() {
	__retry_quiet=0
	_retry "$@"
}

# retry_quiet: call _retry() in silent mode
retry_quiet() {
	__retry_quiet=1
	_retry "$@"
}

# _repeat: keep running command up to $1 times, unless it fails
_repeat() (
    __retries="${1}"
    shift
    while :; do
        if ! "$@"; then
            return 1
        fi
        __retries=$((__retries-1))
        if [ "${__retries}" -le 0 ]; then
            break
        fi
    done
    return 0
)

# rndc_dumpdb: call "rndc dumpdb [...]" and wait until it completes
#
# The first argument is the name server instance to send the command to, in the
# form of "nsX" (where "X" is the instance number), e.g. "ns5".  The remaining
# arguments, if any, are appended to the rndc command line after "dumpdb".
#
# Control channel configuration for the name server instance to send the
# command to must match the contents of bin/tests/system/common/rndc.conf.
#
# rndc output is stored in a file called rndc.out.test${n}; the "n" variable is
# required to be set by the calling tests.sh script.
#
# Return 0 if the dump completes successfully; return 1 if rndc returns an exit
# code other than 0 or if the "; Dump complete" string does not appear in the
# dump within 10 seconds.
rndc_dumpdb() {
	__ret=0
	__dump_complete=0
	__server="${1}"
	__ip="10.53.0.`echo "${__server}" | tr -c -d "0-9"`"

	shift
	${RNDC} -c ../common/rndc.conf -p "${CONTROLPORT}" -s "${__ip}" dumpdb "$@" > "rndc.out.test${n}" 2>&1 || __ret=1

	for _ in 0 1 2 3 4 5 6 7 8 9
	do
		if grep '^; Dump complete$' "${__server}/named_dump.db" > /dev/null; then
			mv "${__server}/named_dump.db" "${__server}/named_dump.db.test${n}"
			__dump_complete=1
			break
		fi
		sleep 1
	done

	if [ ${__dump_complete} -eq 0 ]; then
		echo_i "timed out waiting for 'rndc dumpdb' to finish"
		__ret=1
	fi

	return ${__ret}
}

# copy_setports - Copy Configuration File and Replace Ports
#
# Convenience function to copy a configuration file, replacing the tokens
# QUERYPORT, CONTROLPORT and EXTRAPORT[1-8] with the values of the equivalent
# environment variables. (These values are set by "run.sh", which calls the
# scripts invoking this function.)
#
# Usage:
#   copy_setports infile outfile

copy_setports() {
    sed -e "s/@PORT@/${PORT}/g" \
	-e "s/@EXTRAPORT1@/${EXTRAPORT1}/g" \
	-e "s/@EXTRAPORT2@/${EXTRAPORT2}/g" \
	-e "s/@EXTRAPORT3@/${EXTRAPORT3}/g" \
	-e "s/@EXTRAPORT4@/${EXTRAPORT4}/g" \
	-e "s/@EXTRAPORT5@/${EXTRAPORT5}/g" \
	-e "s/@EXTRAPORT6@/${EXTRAPORT6}/g" \
	-e "s/@EXTRAPORT7@/${EXTRAPORT7}/g" \
	-e "s/@EXTRAPORT8@/${EXTRAPORT8}/g" \
	-e "s/@CONTROLPORT@/${CONTROLPORT}/g" \
	-e "s/@DEFAULT_ALGORITHM@/${DEFAULT_ALGORITHM}/g" \
	-e "s/@DEFAULT_ALGORITHM_NUMBER@/${DEFAULT_ALGORITHM_NUMBER}/g" \
	-e "s/@DEFAULT_BITS@/${DEFAULT_BITS}/g" \
	-e "s/@ALTERNATIVE_ALGORITHM@/${ALTERNATIVE_ALGORITHM}/g" \
	-e "s/@ALTERNATIVE_ALGORITHM_NUMBER@/${ALTERNATIVE_ALGORITHM_NUMBER}/g" \
	-e "s/@ALTERNATIVE_BITS@/${ALTERNATIVE_BITS}/g" \
	-e "s/@DISABLED_ALGORITHM@/${DISABLED_ALGORITHM}/g" \
	-e "s/@DISABLED_ALGORITHM_NUMBER@/${DISABLED_ALGORITHM_NUMBER}/g" \
	-e "s/@DISABLED_BITS@/${DISABLED_BITS}/g" \
	$1 > $2
}

#
# Export command paths
#
export ARPANAME
export BIGKEY
export CHECKZONE
export CYGWIN
export DESCRIPTION
export DIG
export FEATURETEST
export FSTRM_CAPTURE
export GENCHECK
export JOURNALPRINT
export KEYCREATE
export KEYDELETE
export KEYFRLAB
export KEYGEN
export KEYSETTOOL
export KEYSIGNER
export KRB5_CONFIG
export KRB5_KTNAME
export LWRESD
export LWTEST
export MAKEJOURNAL
export MDIG
export NAMED
export NSLOOKUP
export NSUPDATE
export NZD2NZF
export PERL
export PIPEQUERIES
export PK11DEL
export PK11GEN
export PK11LIST
export PSSUSPEND
export PYTHON
export RANDFILE
export RESOLVE
export RNDC
export RRCHECKER
export SAMPLEUPDATE
export SIGNER
export SUBDIRS
export TMPDIR
