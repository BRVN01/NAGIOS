#!/bin/bash

# $1 = -l = place
# $2 = Device (Hard Drive) or Montage Point
# $3 = -w = indicates value of Warning
# $4 = Value of Warning
# $5 = -c = indicates value of Critical
# $6 = Value of Critical


help () {
echo "
usage: $0 -l [Device or Montage point] -w [0-100] -c [0-100]

 -l      Device (/dev/sda1) or Montage point (/, /dev, /tmp or others)
 -w =    Warning (Number, from 0 to 100, parameter for a Warning check)
 -c =    Critical (Number, from 0 to 100, parameter for a Critical check)

Example:

$0 -l /dev/sda1 -w 80 -c 90
$0 -l /backup -w 40 -c 60

"
echo "Please, specify the parameters" && return 3
}


check () {

storage=$(df -h -l $2 | tr -s ' ' | sed '1d')

montage_point=$(cut -d ' ' -f 6 <<< "$storage")
percentage_of_use=$(tr -d '%' <<< $(cut -d ' ' -f 5 <<< $storage))

message="${percentage_of_use}% of disk space used."

if [[ $percentage_of_use -le $4 && $percentage_of_use -le $6 ]];then
	echo "OK - $message" && exit 0

elif [[ $percentage_of_use -ge $4 && $percentage_of_use -le $6 ]];then
	echo "WARNING - $message" && exit 1

elif [[ $percentage_of_use -ge $4 && $percentage_of_use -ge $6 ]];then
	echo "CRITIAL - $message" && exit 2

else
	echo "Unknown - $message" && exit 3
fi

}

test $# -eq 6 && check $1 $2 $3 $4 $5 $6 || test $# -lt 6 && help || test $# -gt 6 && help
