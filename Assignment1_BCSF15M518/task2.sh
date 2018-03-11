#!/bin/bash

file_name=$1

lines=(`wc -l $file_name`)	
	
while read line
do
		new=`echo $line`
		content+=( "$new" )
done < $file_name

declare -i count=1
declare -i clines=0
declare -i rem=0

while [ $count -le $lines ]
do 

	rem=" count % 2"
	if [ $rem -eq 0 ]
	then
		echo ${content[$clines]} 1>>evenfile
		count="$count + 1"
		clines="$clines + 1"
	else
		echo ${content[$clines]} 1>>oddfile
		count="$count + 1"
		clines="$clines + 1"
	fi
done
