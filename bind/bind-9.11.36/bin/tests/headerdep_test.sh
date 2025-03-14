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
# Check the installed bind9 headers to make sure that no header
# depends on another header having been included first.
#

prefix=/usr/local
tmp=/tmp/thdr$$.tmp

status=0

echo "Checking for header interdependencies..."

# Make a list of header files.
(cd $prefix/include; find . -name '*.h' -print | sed 's!^./!!') > $tmp

# Check each header.
while read h
do
    echo " - <$h>"

    # Build a test program.
    cat <<EOF >test.c
#include <$h>
EOF

    # Compile the test program.
    if
       gcc  -W -Wall -Wmissing-prototypes -Wcast-qual -Wwrite-strings -Wformat -Wpointer-arith -fno-strict-aliasing -fno-delete-null-pointer-checks  -I$prefix/include -c test.c 2>&1
    then
       :
    else
       status=1
    fi
done <$tmp

rm -f test.c test.o $tmp

exit $status
