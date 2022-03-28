NEED TO EDIT

# Introduction
(about 150-200 words)
Discuss the design of the project. What does this project/product do? Who are the users? What are the technologies you have used? (e.g. bash, docker, git, etc..)

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
```
crontab -e
# Implemenation
Discuss how you implement the project.
## Architecture
Draw a cluster diagram with three Linux hosts, a DB, and agents (use draw.io website). Image must be saved to the `assets` directory.

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
- `host_usage`

# Test
How did you test your bash scripts and SQL queries? What was the result?

# Deployment
How did you deploy your app? (e.g. Github, crontab, docker)

# Improvements
Write at least three things you want to improve 
e.g. 
- handle hardware update 
- blah
- blah
