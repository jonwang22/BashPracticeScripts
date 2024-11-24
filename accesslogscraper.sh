# You are a DevOps engineer at Nike, responsible for monitoring and analyzing the traffic to the companys e-commerce platform. Your role involves ensuring the performance, security, and reliability of the web servers that handle millions of requests daily from customers around the world.
# The server generates a log file named access.log which captures every web request made to the platform. Each entry in the log includes details such as the timestamp, IP address, request type, endpoint accessed, and the HTTP response code. Your task is to create a one-liner that:
# Reads the content of access.log.
# Extracts only the IP addresses.
# Counts the occurrences of each IP address to identify how many requests came from each IP.(unique addresses)
# Sorts the list by the number of requests in descending order.Saves the sorted list to a file called ip_counts.txt.

# need to look through access.log
cat access.log | grep -o '[0-9]\{1,3\}\.[0-9]\{1,3\}\.[0-9]\{1,3\}\.[0-9]\{1,3\}' | uniq -c | sort -r
# I need to extract IP address from each line

# put that into a temp file, count occurance of each IP

cat access.log | grep -o '[0-9]\{1,3\}\.[0-9]\{1,3\}\.[0-9]\{1,3\}\.[0-9]\{1,3\}' | sort | uniq -c | sort -r > ip_counts.txt

# Isolate IP Address list that into file
# take file as input and then count unique occurrances
# Sort that to descending order
# take output from sort put into new file.
# How do I leverage port to isolate my IP address.