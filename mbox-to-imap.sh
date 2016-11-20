#!/bin/bash

files=export/*.mbox
echo $files

for i in $files; do
	echo $i
	name="$(echo $i | sed -e "s/^export\///" | sed -e "s/.mbox$//")"
	echo $name 
echo	./createimapdir.sh "$name"
#	./createimapdir.sh "$name"
echo	./uploadmbox.sh "$name"
#	./uploadmbox.sh "$name"
##	mv "./export/$name.mbox" "./export/$name.mbox-imported"
done

echo
echo Now recursing into sub1-dirs
echo

find export/ ! -path export/ -maxdepth 1 -type d ! -name "mbox" -print0 | while IFS= read -r -d $'\0' i; do

	echo "$i [debug 1A]"
        dirname="$(echo $i | sed -e "s/^export\/\///")"
        echo "$dirname [debug 1B]"

	files=()
	while read -r -d $'\0'; do
		files+=("$REPLY")
	done < <(find export/"$dirname"/*.mbox -print0)

	echo "${files[@]} [debug 1C]"
	IFS=$'\n'
	echo "${files[0]} [debug 1D]"

	for i in "${files[@]}"; do
		echo "$i [debug 1E]"
		name="$(echo "$i" | sed -e "s/^export\/$dirname\///" | sed -e "s/.mbox$//")"
       		echo "$name [debug 1F]" 
		echo    ./createimapdir.sh "$dirname.$name" [debug 5]
#	        ./createimapdir.sh "$dirname.$name"
		echo    ./uploadmbox-sub.sh "$dirname.$name" "$dirname/$name" [debug 1G]
#	        ./uploadmbox-sub.sh "$dirname.$name" "$dirname/$name"
##	        mv "./export/$dirname/$name.mbox" "./export/$dirname/$name.mbox-imported"
	done

	echo
	echo Finished with sub1-dirs

	echo
	echo Now recursing into sub2-dirs
	echo

	find export/"$dirname"/ ! -path export/"$dirname"/ -maxdepth 1 -type d ! -name "mbox" -print0 | while IFS= read -r -d $'\0' i; do

		echo "$i [debug 2A]"
	        subdirname="$(echo $i | sed -e "s/^export\/$dirname\/\///")"
	        echo "$subdirname [debug 2B]"

		subfiles=()
		while read -r -d $'\0'; do
	                subfiles+=("$REPLY")
	        done < <(find export/"$dirname"/"$subdirname"/*.mbox -print0)

	        echo "${subfiles[@]} [debug 2C]"
	        IFS=$'\n'
	        echo "${subfiles[0]} [debug 2D]"

		for i in "${subfiles[@]}"; do
                	echo "$i [debug 2E]"
                	subname="$(echo "$i" | sed -e "s/^export\/$dirname\/$subdirname\///" | sed -e "s/.mbox$//")"
                	echo "$subname [debug 2F]"
        	echo    ./createimapdir.sh "$dirname.$subdirname.$subname" [debug 2G]
#        	        ./createimapdir.sh "$dirname.$subdirname.$subname"
        	echo    ./uploadmbox-sub.sh "$dirname.$subdirname.$subname" "$dirname/$subdirname/$subname" [debug 2H]
#        	        ./uploadmbox-sub.sh "$dirname.$subdirname.$subname" "$dirname/$subdirname/$subname"
##       	        mv "./export/$dirname/$subdirname/$subname.mbox" "./export/$dirname/$subdirname/$subname.mbox-imported"
        	done

		echo
		echo Finished with sub2-dirs

		echo
        	echo Now recursing into sub3-dirs
        	echo

	        find export/"$dirname"/"$subdirname"/ ! -path export/"$dirname"/"$subdirname"/ -maxdepth 1 -type d ! -name "mbox" -print0 | while IFS= read -r -d $'\0' i; do

	                echo "$i [debug sub3A]"
	                sub2dirname="$(echo $i | sed -e "s/^export\/$dirname\/$subdirname\/\///")"
	                echo "$sub2dirname [debug sub3B]"

	                sub2files=()
        	        while read -r -d $'\0'; do
        	                sub2files+=("$REPLY")
        	        done < <(find export/"$dirname"/"$subdirname"/"$sub2dirname"/*.mbox -print0)

	                echo "${sub2files[@]} [debug sub3C]"
	                IFS=$'\n'
	                echo "${sub2files[0]} [debug sub3D]"

	                for i in "${sub2files[@]}"; do
	                        echo "$i [debug sub3E]"
	                        sub2name="$(echo "$i" | sed -e "s/^export\/$dirname\/$subdirname\/$sub2dirname\///" | sed -e "s/.mbox$//")"
	                        echo "$sub2name [debug sub3F]"
	                echo    ./createimapdir.sh "$dirname.$subdirname.$sub2dirname.$sub2name" [debug sub3G]
#	                        ./createimapdir.sh "$dirname.$subdirname.$sub2dirname.$sub2name"
	                echo    ./uploadmbox-sub.sh "$dirname.$subdirname.$sub2dirname.$sub2name" "$dirname/$subdirname/$sub2dirname/$sub2name" [debug sub3H]
#	                        ./uploadmbox-sub.sh "$dirname.$subdirname.$sub2dirname.$sub2name" "$dirname/$subdirname/$sub2dirname/$sub2name"
##	                       mv "./export/$dirname/$subdirname/$sub2dirname/$sub2name.mbox" "./export/$dirname/$subdirname/$sub2dirname/$sub2name.mbox-imported"
	                done

			echo
			echo Finished with sub3-dirs

			echo
	                echo Now recursing into sub4-dirs
	                echo

	                find export/"$dirname"/"$subdirname"/"$sub2dirname"/ ! -path export/"$dirname"/"$subdirname"/"$sub2dirname"/ -maxdepth 1 -type d ! -name "mbox" -print0 | while IFS= read -r -d $'\0' i; do

	                        echo "$i [debug sub4A]"
	                        sub3dirname="$(echo $i | sed -e "s/^export\/$dirname\/$subdirname\/$sub2dirname\/\///")"
	                        echo "$sub3dirname [debug sub4B]"

	                        sub3files=()
	                        while read -r -d $'\0'; do
	                                sub3files+=("$REPLY")
	                        done < <(find export/"$dirname"/"$subdirname"/"$sub2dirname"/"$sub3dirname"/*.mbox -print0)

	                        echo "${sub3files[@]} [debug sub4C]"
	                        IFS=$'\n'
	                        echo "${sub3files[0]} [debug sub4D]"

	                        for i in "${sub3files[@]}"; do
	                                echo "$i [debug sub4E]"
	                                sub3name="$(echo "$i" | sed -e "s/^export\/$dirname\/$subdirname\/$sub2dirname\/$sub3dirname\///" | sed -e "s/.mbox$//")"
	                                echo "$sub3name [debug sub4F]"
	                        echo    ./createimapdir.sh "$dirname.$subdirname.$sub2dirname.$sub3dirname.$sub3name" [debug sub4G]
	                                ./createimapdir.sh "$dirname.$subdirname.$sub2dirname.$sub3dirname.$sub3name"
	                        echo    ./uploadmbox-sub.sh "$dirname.$subdirname.$sub2dirname.$sub3dirname.$sub3name" "$dirname/$subdirname/$sub2dirname/$sub3dirname/$sub3name" [debug sub4H]
	                                ./uploadmbox-sub.sh "$dirname.$subdirname.$sub2dirname.$sub3dirname.$sub3name" "$dirname/$subdirname/$sub2dirname/$sub3dirname/$sub3name"
##                             mv "./export/$dirname/$subdirname/$sub2dirname/$sub3dirname/$sub3name.mbox" "./export/$dirname/$subdirname/$sub2dirname/$sub3dirname/$sub3name.mbox-imported"
	                        done

                        echo
                        echo Finished with sub4-dirs
			echo

			done

		done

	done

done
