#!/bin/bash

HOST=$1
commnuty=$2
warning=$3
critical=$4

HOST=127.0.0.1
commnuty=public

CMD="snmpget -OQv -v2c -c $commnuty $HOST"

OIDs[0]=".1.3.6.1.4.1.2021.4.5.0"
OIDs[1]=".1.3.6.1.4.1.2021.4.11.0"
OIDs[2]=".1.3.6.1.4.1.2021.4.14.0"
OIDs[3]=".1.3.6.1.4.1.2021.4.15.0"

loop="memory_total
memory_free
memory_buff
memory_cache"

count="0"

for i in $loop
do
    eval $i="$($CMD ${OIDs[$count]} | sed 's/kB//')"
    eval $i="$(($i/1024))"
    count=$(($count+1))
done

used=$(($memory_total-($memory_free+$memory_buff+$memory_cache+70)))


if [ ${used} -ge ${critical} ]; then
  echo "CRITICAL: CPU usage is ${used} MB"
  exit 2

elif [ ${used} -ge ${warning} ]; then
  echo "WARNING: CPU usage is ${used} MB"
  exit 1
fi

echo "OK: Memory usage is ${used} MB"
exit 0
