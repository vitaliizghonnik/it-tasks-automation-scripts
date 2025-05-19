# IT Automation Documentation

This documentation covers the scripts available in IT automation repository, their functionality, usage, and examples.
## Bash Shell
### System Health Check
- This script checks the health of the system by checking CPU, memory, available updates, and disk usage.
- It provides a summary of the system's health and can be used to identify potential issues.
- It used for Debian-based systems like Ubuntu, because it uses `apt` for package management.
- It's scheduled to run every time system boots up.
- It can be run manually by executing the script like so 
    ```bash
    sudo ./system_health.sh
    ```
    - While it's important to note that the script should be run with root privileges to ensure it has access to all necessary system information.
    - Make the script executable
        ```bash
        chmod +x system_health.sh
        ```