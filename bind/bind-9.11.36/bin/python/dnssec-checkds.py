#!
############################################################################
# Copyright (C) Internet Systems Consortium, Inc. ("ISC")
#
# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, you can obtain one at https://mozilla.org/MPL/2.0/.
#
# See the COPYRIGHT file distributed with this work for additional
# information regarding copyright ownership.
############################################################################

import os
import sys

sys.path.insert(0, os.path.dirname(sys.argv[0]))
if os.name != 'nt':
    if '': # value of --with-python-install-dir
        sys.path.insert(1, '')
    else:
        sys.path.insert(1, os.path.join('/usr/local', 'lib',
                        'python' + sys.version[:3], 'site-packages'))

import isc.checkds

if __name__ == "__main__":
    isc.checkds.main()
