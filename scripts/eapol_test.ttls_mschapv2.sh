#!/bin/bash
#APP: FreeRadius V3.x.x EAPOL TTLS-MSChapV2 Test
#AUTHOR: Kris Armstrong
#DATE: May 7, 2019

source conf/main.conf

# Setting Identity and Password from main.conf
sed -i "/identity=/c\ \tidentity=\"$identity\"" "$ttls_mschapv2_conf"
sed -i "/password=/c\ \tpassword=\"$password\"" "$ttls_mschapv2_conf"

if eapol_test -c "$ttls_mschapv2_conf" -a "$ipaddress" -p "$port" -s "$secretkey" -r1 | grep -q 'SUCCESS'; then
	echo "TTLS-MSChapV2 - SUCCESSFUL"
else
	echo "TTLS-MSChapV2 - FAILED"

fi;


