#!/bin/bash

. ./config

dir="$1"
echo "Directory is: $dir"

python ./imap_upload.py --host=$mtihost --port=$mtiport --ssl --user=$mtiuser --password=$mtipass --box="$dir" "./export/$dir.mbox"

