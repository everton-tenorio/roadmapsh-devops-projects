#!/bin/bash
# author: Everton Tenorio

# Download the sample nginx access log file
# wget https://gist.githubusercontent.com/kamranahmedse/e66c3b9ea89a1a030d3b739eeeef22d0/raw/77fb3ac837a73c4f0206e78a236d885590b7ae35/nginx-access.log


echo "Top 5 IP addresses with the most requests:"
awk '{print $1}' nginx-access.log | sort | uniq -c | sort -nr | head -5 | awk '{printf "  %s - %d %s\n", $2, $1, ($1 == 1 ? "request" : "requests")}'

echo -e "\nTop 5 most requested paths:"
awk '{print $7}' nginx-access.log | sort | uniq -c | sort -nr | head -5 | awk '{printf "  %s - %d %s\n", $2, $1, ($1 == 1 ? "request" : "requests")}'

echo -e "\nTop 5 response status codes:"
awk '{if ($9 ~ /^[0-9]{3}$/) print $9}' nginx-access.log | sort | uniq -c | sort -nr | head -5 | awk '{printf "  %s - %d requests\n", $2, $1}'

echo -e "\nTop 5 user agents:"
awk -F'"' '{print $6}' nginx-access.log | sort | uniq -c | sort -nr | head -5