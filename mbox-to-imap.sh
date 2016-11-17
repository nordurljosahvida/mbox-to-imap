#!/bin/bash

files=export/*.mbox
echo $files

for i in $files; do
	echo $i
	name="$(echo $i | sed -e "s/^export\///" | sed -e "s/.mbox$//")"
	echo $name 
echo	./createimapdir.sh "$name"
	./createimapdir.sh "$name"
echo	./uploadmbox.sh "$name"
	./uploadmbox.sh "$name"
#	mv "./export/$name.mbox" "./export/$name.mbox-imported"
done

echo
echo Now recursing into subdirs
echo

find export/ ! -path export/ -maxdepth 1 -type d ! -name "mbox" -print0 | while IFS= read -r -d $'\0' i; do

        dirname="$(echo $i | sed -e "s/^export\/\///")"
        echo "$dirname [debug 1]"
	files="$(ls export/"$dirname"/ | grep .mbox)"
	echo "$files [debug 2]"

	IFS=$'\n'
	for i in $files; do

		echo "$i [debug 3]"
		name="$(echo "$i" | sed -e "s/^$dirname\///" | sed -e "s/.mbox$//")"
        	echo "$name [debug 4]" 
	echo    ./createimapdir.sh "$dirname.$name" [debug 5]
	        ./createimapdir.sh "$dirname.$name"
	echo    ./uploadmbox-sub1.sh "$dirname.$name" "$dirname/$name" [debug 6]
	        ./uploadmbox-sub1.sh "$dirname.$name" "$dirname/$name"
#	        mv "./export/$dirname/$name.mbox" "./export/$dirname/$name.mbox-imported"
	done
done

