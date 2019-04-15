#! /bin/bash
set -eu

# file with date like 2017-01-30 on each line
DATES_FILE=$1 

while read DATE_LINE; do
    curl -s https://api.cbix.ca/v1/history | jq .data | jq -c ".[] | select(.date | contains(\"$DATE_LINE\"))" | jq -r .close
done <$DATES_FILE

