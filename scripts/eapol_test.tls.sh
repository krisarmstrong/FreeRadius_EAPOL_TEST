#!/bin/bash
#APP: FreeRadius V3.x.x EAPOL TLS Test
#AUTHOR: Kris Armstrong
#DATE: May 7, 2019

tls_config=../conf/eapol_test.tls.conf

SOURCE_DIR=/etc/freeradius/3.0/certs
files=(
   "$SOURCE_DIR"/user*.pem
)

for i in "${files[@]}"
do

	# Replacing client_cert= & private_key= with new key and cert
    sed -i "/client_cert=/c\ \tclient_cert=\"$i\"" tls_config
	sed -i "/private_key=/c\ \tprivate_key=\"$i\"" tls_config 
	if eapol_test -c tls_config -a$1 -p$2 -s $3 -r1 | grep -q 'SUCCESS'; then
		echo "TLS - $i - SUCCESSFUL"
	else
		echo "TLS - $i - FAILED"

	fi;
done

# eapol_test -c eapol_test.conf.tls -a127.0.0.1 -p1812 -s testing123 -r1

