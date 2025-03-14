#!/bin/sh
#
# Copyright (C) 2015-2018  Internet Systems Consortium, Inc. ("ISC")
#
# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.
#
# THE SOFTWARE IS PROVIDED "AS IS" AND ISC DISCLAIMS ALL WARRANTIES WITH
# REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED WARRANTIES OF MERCHANTABILITY
# AND FITNESS.  IN NO EVENT SHALL ISC BE LIABLE FOR ANY SPECIAL, DIRECT,
# INDIRECT, OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES WHATSOEVER RESULTING FROM
# LOSS OF USE, DATA OR PROFITS, WHETHER IN AN ACTION OF CONTRACT, NEGLIGENCE
# OR OTHER TORTIOUS ACTION, ARISING OUT OF OR IN CONNECTION WITH THE USE OR
# PERFORMANCE OF THIS SOFTWARE.
#
# Script used to execute unit tests described by the Atffile in the current
# directory.  It exits with return value of atf-run, which will be 0 if all
# tests passed, non-zero otherwise.
#

# Add configured path to ATF tools, atf-run and atf-report
PATH=":${PATH}"
export PATH
ATFRUN=`type atf-run 2>/dev/null | awk '{print $3}'`
KYUA=`type kyua 2>/dev/null | awk '{print $3}'`

# colors if not outputting to a dumb terminal and stdout is a tty
if test "$TERM" != dumb && { test -t 1; } 2>/dev/null; then \
    red='\033[0;31m'
    green='\033[0;32m'
    noclr='\033[0m'

    # if echo supports -e, we must use it to set colors
    # (output will be "" if its supported)
    if [ -z "`echo -e`" ]
    then
	dash_e="-e"
    fi
fi;

header="===================================================="

status=0
if [ -n "" -a -x "$ATFRUN" -a -f Atffile ]
then
    # run the tests
    echo "Running unit tests..."
	atf-run > atf.out
	status=$?

    # set color based on success/failure
	if [ $status -eq 0 ]
	then
	color=$green
	else
	color=$red
	fi

    # spit out the test report
    # We print everything upto the summary in
    # "no color".  Print the summary in our
    # result color.
    cat atf.out | atf-report | while read line
    do
	cnt=`echo $line | grep -c "Summary"`
	if [ $cnt -eq 1 ]
	then
	    echo $dash_e $color$header
	fi
	echo $line;
    done
    echo $dash_e $header$noclr

    # clean up unless there were test failures
    if [ $status -eq 0 ]
    then
	rm -f atf.out
    fi
elif [ -n "" -a -x "$KYUA" -a -f Kyuafile ]
then
    echo "Running unit tests..."
    kyua --logfile kyua.log test
    status=$?

    kyua report

    if [ $status -eq 0 ]
    then
	rm -f kyua.log
    fi
fi
exit $status
