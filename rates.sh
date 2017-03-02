#! /bin/bash
set -eu

DATE=$1 # 2017-01-31
AMT=$2 

CAD_USD=$(curl -s http://api.fixer.io/"$DATE"?base=USD | jq .rates.CAD)
USD_BTC=$(curl -s "http://api.coindesk.com/v1/bpi/historical/close.json?start=$DATE&end=$DATE" | jq .bpi[\"${DATE}\"])

CAD_BTC=$( echo $CAD_USD*$USD_BTC | bc )

echo "CAD/USD = $CAD_USD"
echo "USD/BTC = $USD_BTC"
echo "CAD/BTC = $CAD_BTC"
echo "${AMT} CAD = $( echo $AMT/$CAD_BTC | bc -l) BTC"
