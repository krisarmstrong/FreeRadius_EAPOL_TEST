#!/bin/bash
#APP: FreeRadius V3.x.x EAPOL TTLS-MD5 Test
#AUTHOR: Kris Armstrong
#DATE: May 7, 2019

ttls_md5_config=../conf/eapol_test.ttls_md5.conf


# eapol_test -c config -a127.0.0.1 -p1812 -s testing123 -r1

if eapol_test -c ttls_md5_config -a$1 -p$2 -s $3 -r1 | grep -q 'SUCCESS'; then
	echo "TTLS-MD5 - SUCCESSFUL"
else
	echo "TTLS-MD5 -FAILED"

fi;



