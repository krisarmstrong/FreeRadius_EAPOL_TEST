#!/bin/bash
#APP: FreeRadius V3.x.x EAPOL PEAP Test
#AUTHOR: Kris Armstrong
#DATE: May 7, 2019

source conf/main.conf

if eapol_test -c "$eap_fast_conf" -a "$ipaddress" -p "$port" -s "$secretkey" -r 1 | grep -q 'SUCCESS'; then
	echo "EAP-FAST - SUCCESSFUL"
else
	echo "EAP-FAST - FAILED"

fi;
