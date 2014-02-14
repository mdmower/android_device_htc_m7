#!/bin/sh

set -e

while [ "$choice" != "1" ] && [ "$choice" != "2" ] && [ "$choice" != "3" ]; do
    echo "1: m7"
    echo "2: m7spr"
    echo "3: m7vzw"
    read -p "Select a device: " choice
done

case "$choice" in
"1" )
    export DEVICE=m7
;;
"2" )
    export DEVICE=m7spr
;;
"3" )
    export DEVICE=m7vzw
;;
esac

export VENDOR=htc
./../m7-common/extract-files.sh $@
