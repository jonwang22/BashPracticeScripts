# Bash

# Monitor specific file
# file is /var/log/syslog
# create script that checks file every 60 seconds
# need script to run and print out last 10 lines
# give me last 10 lines

#!/bin/bash
# while loop
while true;
do
# grab last 10 lines
    tail -10 /var/log/syslog
# sleep 60 seconds
    sleep 60
done