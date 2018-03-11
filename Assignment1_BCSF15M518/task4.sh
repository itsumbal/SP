#!/bin/bash

echo -en "ENTER FILE NAME : "
read file_name

declare -i check=0
declare -i no_of_lines=0

if [ -e $file_name ]
then 

	no_of_lines=(`wc -l $file_name`)	
	no_of_lines="$no_of_lines-1"

	while read line
	do
		new=`echo $line`
		content+=( "$new" )
	done < $file_name
	rm $file_name
	for i in `seq 0 $no_of_lines `
	do
		check=0
		ii=` expr $i + 1 `
		for j in `seq $ii $no_of_lines`
		do
		s1=${content[$i]}
		s2=${content[$j]}
		echo $i
		echo $s1 
		echo $j
		echo $s2
			if [ "$s1" = "$s2" ]
			then
				check=1
				break
			fi
		done
		
		if [ $check -eq 0 ]
		then
			echo ${content[$i]} 1>>$file_name
		fi
	
	done  
	
else
	echo "File does not exsist"
fi
