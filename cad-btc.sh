#! /bin/bash
set -eu

DATE=$1 # 2017-01-31

echo "---------------------------------------"
CAD_BTC=$(curl -s https://api.cbix.ca/v1/history | jq .data | jq -c ".[] | select(.date | contains(\"$DATE\"))" | jq -r .close)
echo "FROM api.cbix.ca:"
echo "CAD/BTC = $CAD_BTC"
