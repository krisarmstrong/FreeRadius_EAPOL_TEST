#!/bin/bash
#APP: FreeRadius V3.x.x EAPOL TTLS-MSChapV2 Test
#AUTHOR: Kris Armstrong
#DATE: May 7, 2019

eapol_test -c eapol_test.conf.ttls_mschapv2 -a127.0.0.1 -p1812 -s testing123 -r1

if eapol_test -c eapol_test.conf.ttls_mschapv2 -a$1 -p$2 -s $3 -r1 | grep -q 'SUCCESS'; then
	echo "TTLS-MSChapV2 - SUCCESSFUL"
else
	echo "TTLS-MSChapV2 - FAILED"

fi;

# eapol_test -c eapol_test.conf.ttls_mschapv2 -a127.0.0.1 -p1812 -s testing123 -r1


