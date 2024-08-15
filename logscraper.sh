#!/bin/bash

# We need to parse through a log file for "404" error messages and identify the IP addresses that are tied to those "404" errors.
# Once we find a list we need to provide the number of times each IP is encountered within our logs.

# First we need to isolate our 404 error messages. We can grep for 404 but that will find all messages that have any occurrence of "404"
# What we are really interested in is only the HTTP 404 response codes.

echo "Please give me the absolute filepath to the logfile you want to scrape through: "
read logfile

tmplog=/tmp/tmplogfile.log

# Finding the IPs using awk and grepping for the specific 404 error message.
cat $logfile | grep -i 'HTTP/1.1\"\" 404' | awk -F'\"' '{print $2}' > $tmplog
cat $tmplog | awk '{print$1}' | sort | uniq -c | sort -r


#while true do;

