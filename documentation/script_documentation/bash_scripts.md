## Bash Scripts

### System Health Check (`system_health.sh`)

**Purpose:** Monitor system resources and health metrics on Linux servers.

**Features:**
- Disk space monitoring
- Memory usage tracking
- CPU load analysis
- Package updates checking
- Service status verification such as SSH server, and OpenVPN server

**Usage:**
```bash
./system_health.sh
```

**Output Location:**

Creates logs in `/var/log/system_health_2025-05-18_10-34-27.log`

**Screenshot of System Health Log file:**

![System Health Check Output](/website/assets/images/screenshots/system_health_output.png)

**Part of the script from system_health.sh file:**

[Link to system_health.sh file](/scripts/bash/system_health.sh)


```bash
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
echo -e "\n--- Disk Space Usage ---" >> $LOG_FILE
df -h | grep -v "tmpfs" >> $LOG_FILE 
```

### **Cron Configuration:**
In terminal run: `crontab -e`, that brings the window attached below

**Screenshot of Crontab file:**

![Crontab File](/website/assets/images/screenshots/crontab_file.png)

Insert the following script into crontab file:

```bash
# Run system health check every time system boots.
@reboot /home/vitalii/Documents/script/system_health.sh
```

