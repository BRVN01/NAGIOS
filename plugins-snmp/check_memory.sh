#!/bin/bash

HOST=$1
commnuty=$2
warning=$3
critical=$4

CMD="snmpget -OQv -v2c -c $commnuty $HOST"

OIDs[0]=".1.3.6.1.4.1.2021.4.5.0"
OIDs[1]=".1.3.6.1.4.1.2021.4.11.0"
OIDs[2]=".1.3.6.1.4.1.2021.4.14.0"
OIDs[3]=".1.3.6.1.4.1.2021.4.15.0"
OIDs[4]=".1.3.6.1.4.1.2021.4.3.0"

loop="memory_total
memory_free
memory_buff
memory_cache
memory_total_swap"

count="0"

SNMP () {

for i in $loop
do
	if [[ "$($CMD ${OIDs[$count]})" ]];then
		eval $i="$($CMD ${OIDs[$count]} | sed 's/kB//')"
		eval $i="$(($i/1024))"
		count=$(($count+1))
	else
		exit 3
	fi
done

memory_free=$(($memory_free-$memory_total_swap))

used=$(($memory_total-($memory_free+$memory_buff+$memory_cache+70)))

}

verify () {
if [[ ${used} -ge ${critical} ]]; then
	echo "CRITICAL: Memory usage is ${used} MB"
	exit 2

elif [[ ${used} -ge ${warning} ]]; then
	echo "WARNING: Memory usage is ${used} MB"
	exit 1

elif [[ ${used} -lt ${warning} ]];then
	echo "OK: Memory usage is ${used} MB"
	exit 0

else
	echo ""
	exit 3
fi
}

SNMP
verify
