#! /bin/bash
set -eu

DATE=$1 # 2017-01-31
#AMT=$2 

echo "---------------------------------------"
CAD_BTC=$(curl -s https://api.cbix.ca/v1/history | jq .data | jq -c ".[] | select(.date | contains(\"$DATE\"))" | jq .close)
echo "FROM api.cbix.ca:"
echo "CAD/BTC = $CAD_BTC"


CAD_USD=$(curl -s http://data.fixer.io/api/"$DATE"?access_key=046901b2eaa97f7cd2ac4f6b68863f63 | jq .rates.CAD)
USD_BTC=$(curl -s "http://api.coindesk.com/v1/bpi/historical/close.json?start=$DATE&end=$DATE" | jq .bpi[\"${DATE}\"])

CAD_BTC=$( echo $CAD_USD*$USD_BTC | bc )

echo "---------------------------------------"
echo "FROM api.coindesk.com AND data.fixer.io"
echo "CAD/USD = $CAD_USD"
echo "USD/BTC = $USD_BTC"
echo "CAD/BTC = $CAD_BTC"
#echo "${AMT} CAD = $( echo $AMT/$CAD_BTC | bc -l) BTC"
