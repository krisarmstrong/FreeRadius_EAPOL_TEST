#!/bin/bash
# APP: FEAPOL V1.0
# Author: Kris Armstrong
# Date: May 7, 2019
source conf/main.conf

echo "Current Configuration"
echo "IP Address:		$ipaddress"
echo "Port #:			$port"
echo "Secret Key:		$secretkey"
echo "Private Key:		$private_key_password"
echo "User ID (Identity):	$identity"
echo "Password:		$password"


# Setting Private Key obtained from main.conf
sed -i "/private_key_passwd=/c\ \tprivate_key_passwd=\"$private_key_password\"" "$tls_conf"
sed -i "/private_key_passwd=/c\ \tprivate_key_passwd=\"$private_key_password\"" "$peap_tls_conf"

sed -i "/private_key2_passwd=/c\ \tprivate_key2_passwd=\"$private_key_password\"" "$ttls_tls_conf"


# Certificate Based EAP Types
if [ "$eapol_test_tls" == "y" ]; then
	./scripts/eapol_test.tls.sh
fi

if [ "$eapol_test_ttls_tls" == "y" ]; then
	./scripts/eapol_test.ttls_tls.sh 
fi

if [ "$eapol_test_peap_tls" == "y" ]; then
	./scripts/eapol_test.peap_tls.sh
fi

# UserName / Password Based EAP Types:
if [ "$eapol_test_peap_mschapv2" == "y" ]; then
	./scripts/eapol_test.peap_mschapv2.sh
fi

if [ "$eapol_test_ttls_md5" == "y" ]; then
	./scripts/eapol_test.ttls_md5.sh
fi

if [ "$eapol_test_ttls_mschapv2" == "y" ]; then
	./scripts/eapol_test.ttls_mschapv2.sh
fi

if [ "$eapol_test_eap_fast" == "y" ]; then
	./scripts/eapol_test.eap_fast.sh
fi
