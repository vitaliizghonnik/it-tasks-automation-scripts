#!/bin/bash

# system_health.sh - Basic system health monitoring script

# Set log file location
if find /var/log -type d -name "system_health"; then
	echo "Directory exists"
else	
	echo "Directory does not exist"
	# Create directory if it doesn't exist
	sudo mkdir /var/log/system_health
fi

# Set log file name as a variable with precise timestamp
LOG_FILE="/var/log/system_health/system_health_$(date +%Y-%m-%d_%H-%M-%S).log"

# Start log entry
echo "=== Start Health Check: $(date) ===" >> $LOG_FILE

# Check disk space
echo -e "n--- Disk Space Usage ---" >> $LOG_FILE
df -h | grep -v "tmpfs" >> $LOG_FILE 

# Check memory usage (available memory space)
echo -e "\n--- Memory Usage ---" >> $LOG_FILE
free -h >> $LOG_FILE

# Check CPU load
echo -e "\n--- System Load ---" >> $LOG_FILE
uptime >> $LOG_FILE

# Check for system update
if command -v apt > /dev/null; then
	echo -e "\n--- Available Updates ---" >> $LOG_FILE
	apt list --upgradable 2>/dev/null >> $LOG_FILE
fi

# Check for running SSH, openvpn services		
echo -e "\n--- Service Status ---" >> LOG_FILE
systemctl status sshd | grep Active >> $LOG_FILE
# systemctl status openvpn-server@server | grep Active >> $LOG_FILE

echo -e "\n=== Health Check Complete ===\n" >> $LOG_FILE