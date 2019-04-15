#! /bin/bash
set -eu

DATE=$1 # 2017-01-31

echo "---------------------------------------"
USD_BTC=$(curl -s "http://api.coindesk.com/v1/bpi/historical/close.json?start=$DATE&end=$DATE" | jq .bpi[\"${DATE}\"])

echo "FROM api.coindesk.com"
echo "USD/BTC = $USD_BTC"
