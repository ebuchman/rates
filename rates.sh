#! /bin/bash
set -eu

DATE=$1 # 2017-01-31

echo "DATE $1"

bash cad-btc.sh $DATE

bash usd-btc.sh $DATE

bash cad-usd.sh $DATE
