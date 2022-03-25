#!/bin/bash

psql_host=$1
psql_port=$2
db_name=$3
psql_user=$4
psql_password=$5

#Check # of args
if [ $# -ne 5 ]; then
  echo 'host_usage argument(s) missing: psql_host, psql_port, db_name, psql_user, psql_password'
  exit 1
fi

meminfo=$(cat /proc/meminfo)
diskii=$(vmstat --unit M)
hostname=$(hostname -f)

#Current time in YYYY-mm-dd HH:MM:SS format
timestamp=$(date '+%Y-%m-%d %H:%M:%S')

#usage
memory_free=$(echo "$meminfo"  | egrep "^MemFree:" | awk '{print $2}' | xargs)
cpu_idle=$(echo "$meminfo"  | egrep "^Inactive:" | awk '{print $2}' | xargs)
cpu_kernel=$(echo "$meminfo"  | egrep "^KernelStack:" | awk '{print $2}' | xargs)
disk_io=$(vmstat -d | awk 'NR==3 {print $10}' | xargs)
disk_available=$(echo "$diskii" | awk 'NR==3 {print $4}' | xargs)


host_id="(SELECT id FROM host_info WHERE hostname='$hostname')";

insert_stmt="INSERT INTO host_usage(timestamp, host_id, memory_free, cpu_idle, cpu_kernel, disk_io, disk_available) VALUES('$timestamp', $host_id, '$memory_free', '$cpu_idle', '$cpu_kernel', '$disk_io', '$disk_available')"

export PGPASSWORD=$psql_password
psql -h $psql_host -p $psql_port -d $db_name -U $psql_user -c "$insert_stmt"
exit $?