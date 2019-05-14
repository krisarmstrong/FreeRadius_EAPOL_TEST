#!/bin/bash
#APP: FreeRadius V3.x.x EAPOL PEAP Test
#AUTHOR: Kris Armstrong
#DATE: May 7, 2019

source conf/main.conf

# Setting Identity and Password from main.conf
sed -i "/identity=/c\ \tidentity=\"$identity\"" "$peap_mschapv2_conf"
sed -i "/password=/c\ \tpassword=\"$password\"" "$peap_mschapv2_conf"

if eapol_test -c "$peap_mschapv2_conf" -a "$ipaddress" -p "$port" -s "$secretkey" -r 1 | grep -q 'SUCCESS'; then
	echo "PEAP-MSChapV2 - SUCCESSFUL"
else
	echo "PEAP-MSChapV2 - FAILED"

fi;
