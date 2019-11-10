#!/bin/sh

# http://oidref.com/1.3.6.1.4.1.2021.11.11

# Usar a OID .1.3.6.1.4.1.2021.11.11.0

# exemplo: 127.0.0.1 v2c public .1.3.6.1.4.1.2021.11.11.0 10 30

host=${1}
version=${2}
community=${3}
oid=${4}

warning=${5}
critical=${6}

idle=`snmpget -Otv -${version} -c ${community} ${host} ${oid} 2> /dev/null | awk '{print $2}'`

echo ${idle} | grep -Eq "^[0-9]{1,3}$" || {
  echo "UNKNOWN: unexpected data"
  exit 3
}

cpu=$((100-${idle}))

if [ ${cpu} -ge ${critical} ]; then
  echo "CRITICAL: CPU usage is ${cpu}%"
  exit 2
fi

if [ ${cpu} -ge ${warning} ]; then
  echo "WARNING: CPU usage is ${cpu}%"
  exit 1
fi

echo "OK: CPU usage is ${cpu}%"
exit 0
