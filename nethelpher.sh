#!/bin/bash
function read_hosts {
	# for loop shoud go here, loop thru the numbers of hosts.
	#make a array for the read host
	#increment count ++
	hosts=`cat $1`
	count=1
	for host in $hosts
	do
		hosts_array[$count]=$host
		((++count))
	done
}

function pick_host {
	count=1
	for host in $1
	do
		echo "$count) $host"
		((++count))
	done
	read -p 'Enter number: ' which_host
        if [[ $which_host -le 1 && $which_host -gt $count ]]
           then
		   exit
	fi
}
done=0
while [ $done  == 0 ]
do
echo "(P) for ping"
echo "(N) for nslookup"
echo "(Q) for quit"

read -p 'Choose letter here: ' cmd
read_hosts $@
case $cmd in
	P|p)
		pick_host "$hosts"
		echo "ping -c 1 ${hosts_array[$which_host]}"
		ping -c 1 ${hosts_array[$which_host]}
		;;
	N|n)
		pick_host "$hosts"
		echo "nslookup ${hosts_array[$which_host]}"
		nslookup ${hosts_array[$which_host]}
		;;
	Q|q)
	done=1;
	;;
*) echo "Bad choice";
	;;
	esac
done

