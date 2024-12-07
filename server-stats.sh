#!/usr/bin/bash

output=$(top -bn1)
cpu_usage=$(echo "$output" | grep "Cpu(s)" | awk '{print $2 + $4}')
mem_used=$(echo "$output" | grep "MiB Mem" | awk '{print $6 / $4 * 100}')
mem_free=$(echo "$output" | grep "MiB Mem" | awk '{print $8 / $4 * 100}')
mem_cache=$(echo "$output" | grep "MiB Mem" | awk '{print $10 / $4 * 100}')

echo Total CPU Usage: $cpu_usage%
echo ""
echo Memory Info:
echo Used: $mem_used%
echo Free: $mem_free%
echo Buff/Cache: $mem_cache%
echo ""
echo Disk Info:
df -h --total --output=size,used,avail,pcent | sed -n '1p;$p'
echo ""
echo Top 5 Processes by CPU Usage:
top -bn1 | sed -n '7,12p'
echo ""
echo Top 5 Processes by Memory Usage:
top -bn1 | sed -n '7,12p'
