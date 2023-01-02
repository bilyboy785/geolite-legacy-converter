#!/bin/bash

COUNTRY_IPV4="https://dl.miyuru.lk/geoip/maxmind/country/maxmind4.dat.gz"
COUNTRY_IPV6="https://dl.miyuru.lk/geoip/maxmind/country/maxmind6.dat.gz"
CITY_IPV4="https://dl.miyuru.lk/geoip/maxmind/city/maxmind4.dat.gz"
CITY_IPV6="https://dl.miyuru.lk/geoip/maxmind/city/maxmind6.dat.gz"
DEFAULT_PATH="/etc/nginx/geoip"

if [[ ! -z $1 ]]; then
    OUTPUT_PATH=$1
else
    read -p "Full Path to store dat files : (default : /etc/nginx/geoip) " OUTPUT_PATH
    OUTPUT_PATH="${OUTPUT_PATH:=${DEFAULT_PATH}}"
fi


if [[ ! -d ${OUTPUT_PATH} ]]; then
    mkdir -p ${OUTPUT_PATH}
fi

echo "Downloading GZ files"
case $2 in 
    ipv4)
        wget -q -O ${OUTPUT_PATH}/geolite-country-ipv4.dat.gz ${COUNTRY_IPV4}
        wget -q -O ${OUTPUT_PATH}/geolite-city-ipv4.dat.gz ${CITY_IPV4}
        ;;
    ipv6)
        wget -q -O ${OUTPUT_PATH}/geolite-country-ipv6.dat.gz ${COUNTRY_IPV6}
        wget -q -O ${OUTPUT_PATH}/geolite-city-ipv6.dat.gz ${CITY_IPV6}
        ;;
    *)
        wget -q -O ${OUTPUT_PATH}/geolite-country-ipv6.dat.gz ${COUNTRY_IPV6}
        wget -q -O ${OUTPUT_PATH}/geolite-city-ipv6.dat.gz ${CITY_IPV6}
        wget -q -O ${OUTPUT_PATH}/geolite-country-ipv4.dat.gz ${COUNTRY_IPV4}
        wget -q -O ${OUTPUT_PATH}/geolite-city-ipv4.dat.gz ${CITY_IPV4}
        ;;
esac

for GZIP_FILE in $(find ${OUTPUT_PATH} -type f -name "*.gz")
do
    gunzip $GZIP_FILE
done