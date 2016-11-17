#!/bin/bash

. ./config

dir="$1"
echo
echo "Directory is: $dir"
echo

imapscript () {
echo "tag login $mtiuser $mtipass"
echo "tag create \"$dir\""
echo "tag subscribe \"$dir\""
echo "tag logout"
}

imapscript | openssl s_client -crlf -quiet -connect $mtihost:$mtiport -ign_eof
