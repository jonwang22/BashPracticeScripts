# Create a script that checks if Jenkins is running and its associated port is open. If the service is running but the port is closed, attempt to open the port using firewall rules. If the service is not running, start the service and open the port.

# Output Example:

# $ ./jenkins_check.sh
# Checking if Jenkins is running...
# Jenkins is not running.
# Attempting to start the Jenkins service...
# Jenkins has been started (PID: 67890).
# Checking if port 8080 is open...
# Port 8080 is closed.
# Attempting to open port 8080 using firewall rules...
# Port 8080 has been successfully opened.
# Jenkins is now running and accessible on port 8080.