ave hostname to a variable
hostname=$(hostname -f)

#save number of CPU to a variable
lscpu_out=`lscpu`
#save number of Memory to a variable
meminfo=$(cat /proc/meminfo)

diskio=$(vmstat --unit M)

#note: `xargs` is a trick to remove leading and trailing white spaces
cpu_number=$(echo "$lscpu_out"  | egrep "^CPU\(s\):" | awk '{print $2}' | xargs)

#hardware
hostname=
cpu_number=$(echo "$lscpu_out"  | egrep "^CPU\(s\):" | awk '{print $2}' | xargs)
cpu_architecture=$(echo "$lscpu_out"  | egrep "^Architecture:" | awk '{print $2}' | xargs)
cpu_model=$(echo "$lscpu_out"  | egrep "^Model:" | awk '{print $2}' | xargs)
cpu_mhz=$(echo "$lscpu_out"  | egrep "MHz:" | awk '{print $3}' | xargs)
l2_cache=$(echo "$lscpu_out"  | egrep "^L2 cache:" | awk '{print $3}' | xargs)
total_mem=$(echo "$meminfo"  | egrep "^MemTotal:" | awk '{print $2,$3}' | xargs)
timestamp=$(echo "$vmt" | egrep -oE '[^ ]+$' | awk '{ print $NF }')
 #current timestamp in `2019-11-26 14:40:19` format vmstat -t

#usage
memory_free=$(echo "$meminfo"  | egrep "^MemFree:" | awk '{print $2,$3}' | xargs)
cpu_idle=$(echo "$meminfo"  | egrep "^Inactive:" | awk '{print $2,$3}' | xargs)
cpu_kernel=$(echo "$meminfo"  | egrep "^KernelStack:" | awk '{print $2,$3}' | xargs)
disk_io=
disk_available=$(echo "$diskio"  | grep -a3 "io" | awk '{ print $4 }' | xargs)
