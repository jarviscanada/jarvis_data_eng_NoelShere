NEED TO EDIT

# Introduction
The Jarvis Linux Cluster Administration (LCA) team manages a Linux cluster of 10 nodes/servers running CentOS 7. These servers are internally connected through a switch and able to communicate through internal IPv4 addresses.

# Quick Start
Use markdown code block for your quick-start commands
1. Start a psql instance using psql_docker.sh
```
./scripts/psql_docker.sh start|stop|create [db_username][db_password]
```
```
./scripts/psql_docker.sh create db_username db_password
```
```
./scripts/psql_docker.sh start
```
2. Create tables using ddl.sql
```
psql -h localhost -U postgres -d host_agent -f ddl.sql
```
3.Insert hardware specs data into the DB using host_info.sh
```
bash scripts/host_info.sh localhost 5432 host_agent postgres password
```
4.Insert hardware usage data into the DB using host_usage.sh
```
bash scripts/host_usage.sh localhost 5432 host_agent postgres password
```
5.Crontab setup

```
crontab -e
```
```
* * * * * bash /<file path>/scripts/host_usage.sh localhost 5432 host_agent postgres password > /tmp/host_usage.log
```
# Implemenation
1) A psql instance is used to contain all the data
2) The Bash agent is able to insert the usage and info into a psql instance
3) The Host_info and Host_usage collect hardware and CUP/memory infomation and inserts it into the database.
## Architecture

![image](https://github.com/jarviscanada/jarvis_data_eng_NoelShere/blob/develop/linux_sql/arc.png)



## Scripts
Shell script description and usage (use markdown code block for script usage)
- psql_docker.sh
- host_info.sh
- host_usage.sh
- crontab
- queries.sql (describe what business problem you are trying to resolve)

## Database Modeling
Describe the schema of each table using markdown table syntax (do not put any sql code)
- `host_info` 
- 
| Name  | Type | Description |
| ----- | ---- | ----------- |
| id    | PRIMARY KEY     | uniqe key,connects to foreign key |
| hostname | VARCHAR | Stores name of the host |
| cpu_number | INTERGER | stores the number of cpu |
| cpu_architecture | VARCHAR | stores cpu architecture eg.64bit |
| cpu_model | VARCHAR | stores model of the cpu |
| cpu_mhz | FLOAT | stores the CPU clock speed |
| L2_cache | VARCHAR | stores the cache |
| total_mem | INTERGER | stores the total memory |
| timestamp | TIMESTAMP | stores the time and data |

- `host_usage`

| Name  | Type | 
| ----- | ---- | 
| host_id    | Foreign KEY |
| memory_free   | INTEGER | 
| cpu_idle    | INTERGER |
| cpu_kernel    | INTEGER | 
| disk_io    | INTEGER | 
| disk_available    | INTEGER | 

# Test
How did you test your bash scripts and SQL queries? What was the result?

1) The usage files (host_info.sh & host_usage.sh) were tested on the bash command line.

2) Docker file was tested buy running it and 

3) Ddl.sql script was tested when creating the database in postgres then applying the "SELECT" function in host_agent which would retrieve table data.

# Deployment
The application is deployed through the gcp instance running CentOS 7.

# Improvements
Write at least three things you want to improve 
e.g. 
- handle hardware update 
- imporve code efficiency 
- reduce to 1 bash script
