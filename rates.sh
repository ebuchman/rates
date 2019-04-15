#! /bin/bash
set -eu

DATE=$1 # 2017-01-31

echo "DATE $1"
echo "---------------------------------------"
CAD_BTC=$(curl -s https://api.cbix.ca/v1/history | jq .data | jq -c ".[] | select(.date | contains(\"$DATE\"))" | jq -r .close)
echo "FROM api.cbix.ca:"
echo "CAD/BTC = $CAD_BTC"


echo "---------------------------------------"
USD_BTC=$(curl -s "http://api.coindesk.com/v1/bpi/historical/close.json?start=$DATE&end=$DATE" | jq .bpi[\"${DATE}\"])

echo "FROM api.coindesk.com"
echo "USD/BTC = $USD_BTC"


echo "---------------------------------------"
CAD_USD=$(curl -s "https://www.bankofcanada.ca/valet/observations/FXUSDCAD/json?start_date=$DATE&end_date=$DATE" |  jq .observations[0].FXUSDCAD.v )
echo "FROM bankofcanada.ca"
echo "CAD/USD = $CAD_USD"
