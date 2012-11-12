#!/bin/bash

# A script to patch the moved 4.4.7 tool chain RPATH for Android.

# Copyright 2012 Synopsys Inc. All rights reserved.

# Contributed by Jeremy Bennett <jeremy.bennett@embecosm.com>

# This program is free software; you can redistribute it and/or modify it
# under the terms of the GNU General Public License as published by the Free
# Software Foundation; either version 3 of the License, or (at your option)
# any later version.

# This program is distributed in the hope that it will be useful, but WITHOUT
# ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
# FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
# more details.

# You should have received a copy of the GNU General Public License along with
# this program; if not, write to the Free Software Foundation, Inc., 51
# Franklin Street - Fifth Floor, Boston, MA 02110-1301, USA.

# This source code file has been included in a modified Synopsys distribution
# of Android Gingerbread and is distributed under the terms of the license
# governing Android Gingerbread.  Please see the copyright, disclaimer, and
# licensing information included with Android Gingerbread for licensing terms.

# This will always run under Ubuntu and bash, so we can be use operations
# specific to that environment.

# Usage: Run with no arguments in the specific tool chain directory
# (i.e. mydroid/prebuilt/linux-x86/toolchain/arc-4.4.7.

tmpf=/tmp/fixmove-$$-1
rootdir=`pwd`

is_good=`echo ${rootdir} | \
    sed -e 's#.*mydroid/prebuilt/linux-x86/toolchain/arc-4.4.7##'`

if [ "x$is_good" != "x" ]
then
    echo $rootdir does not appear to be a valid Android ARC 4.4.7 tool directory
fi

find . -type f -exec file {} \; | \
    grep 'LSB executable, x86-64' | \
    sed -e 's/:.*$//' > ${tmpf}

filelist=`cat ${tmpf}`

for f in ${filelist}
do
    new_rpath=`readelf -d ${f} | \
	grep RPATH | \
	sed -n -e "s#.*\[/home/fdols/arc_gingerbread-2.3_r2/prebuilt/linux-x86/toolchain/arc-4.4.7/\(.*\)\]#${rootdir}/\1#p"`
    if [ "x${new_rpath}" != "x" ]
    then
	patchelf --set-rpath ${new_rpath} ${f}
    fi
done

rm ${tmpf}
