#!/bin/bash

#################################
## Begin of user-editable part ##
#################################

POOL=sia1.ethermine.org:4444
WALLET=0x63f14D61Ab333211eC52561bE0Fc963177E8DE20.lolMinerWorker

#################################
##  End of user-editable part  ##
#################################

cd "$(dirname "$0")"

./lolMiner --algo ETHASH --pool $POOL --user $WALLET $@
while [ $? -eq 42 ]; do
    sleep 10s
    ./lolMiner --algo ETHASH --pool $POOL --user $WALLET $@
done
