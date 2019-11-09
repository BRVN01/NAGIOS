#!/bin/bash

HOST=$2
INTERFACE=$4
community=$6
warning=$8
critical="${10}"

INTERVAL=5

# $1 = -h (Host)
# $2 = Host (IP)
# $3 = -i (Interface)
# $4 = Number of interface
# $5 = -C (Community)
# $6 = Community
# $7 = -w = indicates value of Warning
# $8 = Value of Warning
# $9 = -c = indicates value of Critical
# $10 = Value of Critical

help () {
echo "
usage: $0 -h [Host] -i [Interface] -C [Community] -w [0-XXX in bits] -c [0-XXX in bits]
 -h =    Remote machine IP
 -i =    Interface number
 -C =    SNMP Community
 -w =    Warning (Number, from 0 to XXX, number of bits for a Warning check)
 -c =    Critical (Number, from 0 to XXX, number of bits for a Critical check)
Example:
$0 -h 127.0.0.1 -i 2 -C public -w 5000 -c 7000
$0 -h 192.168.0.100 -i 3 -C public -w 10000 -c 20000
$0 -h localhost -i 2 -C teste -w 540 -c 750
"
echo "Please, specify the parameters" && return 3
}

check () {
ifOutOctets="1.3.6.1.2.1.2.2.1.16"
ifInOctets="1.3.6.1.2.1.2.2.1.10"

OUT_1=$(snmpwalk -v 2c -c $community $HOST $ifOutOctets.$INTERFACE| awk '{print $4}')
IN_1=$(snmpwalk -v 2c -c $community $HOST $ifInOctets.$INTERFACE | awk '{print $4}')

sleep $INTERVAL

OUT_2=$(snmpwalk -v 2c -c $community $HOST $ifOutOctets.$INTERFACE| awk '{print $4}')
IN_2=$(snmpwalk -v 2c -c $community $HOST $ifInOctets.$INTERFACE | awk '{print $4}')

in=$(($IN_2-$IN_1))
out=$(($OUT_2-$OUT_1))

INPUT=$(((($in)/$INTERVAL)*8))
OUTPUT=$(((($out)/$INTERVAL)*8))
message="IN: ${INPUT} bps - OUT:${OUTPUT} bps"

if [[ ${INPUT} -lt ${8} && ${OUTPUT} -lt ${8} ]];then
    echo "OK - $message" && exit 0

elif [[ ${INPUT} -ge ${10} || ${OUTPUT} -ge ${10} ]];then
    echo "CRITICAL 1 -  $message" && exit 2

elif [[ ${INPUT} -gt ${8} && ${INPUT} -lt ${10} || ${OUTPUT} -gt ${8} && ${OUTPUT} -lt ${10} ]];then
    echo "WARNING -  $message" && exit 1

else
    echo "Unknown - $message" && exit 3
fi
}

execution () {

test $# -eq 10 && check $* || test $# -lt 10 && help || test $# -gt 10 && help

}

execution $*
