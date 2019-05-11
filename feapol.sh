#!/bin/bash
# APP: FEAPOL V1.0
# Author: Kris Armstrong
# Date: May 7, 2019

ipaddr="${1:-127.0.0.1}"
port=${2:-1812}
secrete=${3:-testing123}

echo "The command line optins are IPAddress: $ipaddr Port: $port Secrete: $secrete"

# Certificate Based EAP Types:
./scripts/eapol_test.tls.sh $ipaddr $port $secrete
./scripts/eapol_test.ttls_tls.sh $ipaddr $port $secrete
#./scripts/eapol_test.tls-p12.sh $port $secrete

# UserName / Password Based EAP Types:
./scripts/eapol_test.peap_mschapv2.sh $ipaddr $port $secrete
./scripts/eapol_test.ttls_md5.sh $ipaddr $port $secrete
./scripts/eapol_test.ttls_mschapv2.sh $ipaddr $port $secrete

