#! /bin/bash
set -eu

DATE=$1 # 2017-01-31

echo "---------------------------------------"
CAD_USD=$(curl -s "https://www.bankofcanada.ca/valet/observations/FXUSDCAD/json?start_date=$DATE&end_date=$DATE" |  jq .observations[0].FXUSDCAD.v )
echo "FROM bankofcanada.ca"
echo "CAD/USD = $CAD_USD"
