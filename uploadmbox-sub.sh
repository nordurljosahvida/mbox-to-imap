#!/bin/bash

. ./config

dir="$1"
echo "Directory is: $dir"

imapdir="$1"
localdir="$2"
echo "IMAP Directory is: $imapdir"
echo "Local Directory is: $localdir"

python ./imap_upload.py --host=$mtihost --port=$mtiport --ssl --user=$mtiuser --password=$mtipass --box="$imapdir" "./export/$localdir.mbox"

