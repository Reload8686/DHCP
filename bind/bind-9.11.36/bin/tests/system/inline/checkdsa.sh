# Copyright (C) Internet Systems Consortium, Inc. ("ISC")
#
# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, you can obtain one at https://mozilla.org/MPL/2.0/.
#
# See the COPYRIGHT file distributed with this work for additional
# information regarding copyright ownership.

if [ "0" -eq 0 ]; then
	exit 1
fi
if [ ! -r /dev/random -o ! -r /dev/urandom ]; then
	exit 1
fi

exit 0
