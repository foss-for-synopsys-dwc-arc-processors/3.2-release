#!/bin/bash

tmpf=/tmp/fixmove-$$-1
rootdir=`pwd`

is_good=`echo ${rootdir} | \
    sed -e 's#.*/4.4.7##'`

if [ "x$is_good" != "x" ]
then
    echo $rootdir does not appear to be a valid ARC 4.4.7 tool directory
fi

find . -type f -exec file {} \; | \
    grep 'LSB executable, x86-64' | \
    sed -e 's/:.*$//' > ${tmpf}

filelist=`cat ${tmpf}`

for f in ${filelist}
do
    new_rpath=`readelf -d ${f} | \
	grep RPATH | \
	sed -n -e "s#.*\[/opt/arc/gnu/4.4.7/\(.*\)\]#${rootdir}/\1#p"`
    if [ "x${new_rpath}" != "x" ]
    then
	patchelf --set-rpath ${new_rpath} ${f}
    fi
done

rm ${tmpf}
