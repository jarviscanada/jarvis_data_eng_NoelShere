#!/bin/bash


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


exit 0