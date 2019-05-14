#!/bin/bash
#APP: FreeRadius V3.x.x EAPOL TLS Test
#AUTHOR: Kris Armstrong
#DATE: May 7, 2019

source conf/main.conf

SOURCE_DIR="$client_cert_dir"
files=(
   "$SOURCE_DIR""$client_cert"*.*
)

for i in "${files[@]}"
do
        if [ "$i" == "*.p12" ]; then
                echo "Test $i"

                # Commenting out Cert for P12 per WPA_Supplicant
                sed -i "/client_cert2=/c\ #\tclient_cert2=\"$i\"" "$ttls_tls_conf"
                sed -i "/private_key2=/c\ \tprivate_key2=\"$i\"" "$ttls_tls_conf"

                if eapol_test -c "$ttls_tls_conf" -a "$ipaddress" -p "$port" -s "$secretkey" -r1 | grep -q 'SUCCESS'; then
                        echo "TTLS-TLS - $i - SUCCESSFUL"
                else
                        echo "TTLS-TLS - $i - FAILED"
                fi;

        else
                # Replacing client_cert= & private_key= with new key and cert
                sed -i "/client_cert2=/c\ \tclient_cert2=\"$i\"" "$ttls_tls_conf"
                sed -i "/private_key2=/c\ \tprivate_key2=\"$i\"" "$ttls_tls_conf"

                if eapol_test -c "$ttls_tls_conf" -a "$ipaddress" -p "$port" -s "$secretkey" -r1 | grep -q 'SUCCESS'; then
                        echo "TTLS-TLS - $i - SUCCESSFUL"
                else
                        echo "TTLS-TLS - $i - FAILED"
                fi;
        fi;
done
