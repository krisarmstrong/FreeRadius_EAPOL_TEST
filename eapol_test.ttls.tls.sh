#!/bin/bash
#APP: FreeRadius V3.x.x EAPOL TTLS-MSChapV2 Test
#AUTHOR: Kris Armstrong
#DATE: May 7, 2019


SOURCE_DIR=/etc/freeradius/3.0/certs
files=(
   "$SOURCE_DIR"/user*.pem
   )

   for i in "${files[@]}"
   do
	# eapol_test -c eapol_test.conf.ttls_tls -a127.0.0.1 -p1812 -s testing123 -r1

	if eapol_test -c eapol_test.conf.ttls_tls -a$1 -p$2 -s $3 -r1 | grep -q 'SUCCESS'; then
		echo "TTLS-TLS - $i - SUCCESSFUL"
	else
		echo "TTLS-TLS - $i - FAILED"

	fi;
done

# eapol_test -c eapol_test.conf.ttls_tls -a127.0.0.1 -p1812 -s testing123 -r1

