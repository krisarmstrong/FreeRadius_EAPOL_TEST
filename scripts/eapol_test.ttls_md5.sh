#!/bin/bash
#APP: FreeRadius V3.x.x EAPOL TTLS-MD5 Test
#AUTHOR: Kris Armstrong
#DATE: May 7, 2019

source conf/main.conf

# Setting Identity and Password from main.conf
sed -i "/identity=/c\ \tidentity=\"$identity\"" "$ttls_md5_conf"
sed -i "/password=/c\ \tpassword=\"$password\"" "$ttls_md5_conf"


if eapol_test -c "$ttls_md5_conf" -a "$ipaddress" -p "$port" -s "$secretkey" -r1 | grep -q 'SUCCESS'; then
	echo "TTLS-MD5 - SUCCESSFUL"
else
	echo "TTLS-MD5 -FAILED"

fi;
