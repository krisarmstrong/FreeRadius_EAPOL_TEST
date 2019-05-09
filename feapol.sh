#!/bin/bash
# APP: FEAPOL V1.0
# Author: Kris Armstrong
# Date: May 7, 2019

ipaddr="${1:-127.0.0.1}"
port=${2:-1812}
secrete=${3:-testing123}

echo "The command line optins are IPAddress: $ipaddr Port: $port Secrete: $secrete"
./eapol_test.peap.sh $ipaddr $port $secrete
./eapol_test.tls.sh $ipaddr $port $secrete
./eapol_test.ttls.md5.sh $ipaddr $port $secrete
./eapol_test.ttls.mschapv2.sh $ipaddr $port $secrete
#./eapol_test.tls.p12.sh $port $secrete
./eapol_test.ttls.tls.sh $ipaddr $port $secrete
