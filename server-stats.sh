#!/bin/bash

# author: Everton Tenorio

##### TOTAL CPU USAGE
echo -e "== CPU Usage =="
cpu_usage=$(top -bn1 | grep -i "%Cpu(s)" | awk '{print 100 - $8"% used"}')
echo "Total CPU usage: $cpu_usage"

##### TOTAL MEMORY USAGE (Free vs Used including percentage)
echo -e "\n== Memory Usage =="
mem_total=$(free -m | grep Mem | awk '{print $2}')
mem_used=$(free -m | grep Mem | awk '{print $3}')
mem_free=$(free -m | grep Mem | awk '{print $4}')

mem_usage_perc=$(free | grep Mem | awk '{printf "Used: %.2f %\n", $3/$2  * 100}')
mem_free_perc=$(free | grep Mem | awk '{printf "Free: %.2f %\n", $4/$2  * 100}' )

echo "Total Memory: ${mem_total}MB"
echo "Used Memory: ${mem_used}MB ($mem_usage_perc%)"
echo "Free Memory: ${mem_free}MB ($mem_free_perc)"

# Total disk usage (Free vs Used including percentage)
echo -e "\n== Total disk usage =="
df

# Top 5 processes by CPU usage
echo -e "\n== Top 5 Processes by CPU Usage =="
ps -eo pid,comm,%cpu --sort=-%cpu | head -6

# Top 5 processes by Memory usage
echo -e "\n== Top 5 Processes by Memory Usage =="
ps -eo pid,comm,%mem --sort=-%mem | head -6

