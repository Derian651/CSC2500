#!/bin/bash
if [ ! $# -eq 2 ]; then
	echo "Where file is the file to search and user is the user to find"
	exit 0
fi
if [ ! -e $1 ]; then
	echo "Where file is the file to search and user is the user to find"
	exit 0
fi

count=0
for line in `cat $1`; do
	if [ $line = $2 ]; then
		echo "found on line: " $count
		exit 0
	fi
	count=`expr $count + 1`
done
read -p "Do you wish to add the name to the end of the list Y/N? " response
response=`echo $response | tr [a-z] [A-Z]`
if [ $response = "Y" ]; then
	echo $2  >> $1
fi


	
