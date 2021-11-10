#!/bin/bash

FILENAME="WaterQualityWaterQualityFIPS.csv"
FILESIZE=20MB

HEADER=$(head -1 ${FILENAME})
split --bytes=${FILESIZE} ${FILENAME} CB_Water_Quality_FIPS_
n=1
for section in CB_Water_Quality_FIPS_*
do
    echo ${HEADER} > WaterQualityFIPS_$(printf "%03d\n" ${n}).csv
    sed -i '1d' ${section}
    cat ${section} >> WaterQualityFIPS_$(printf "%03d\n" ${n}).csv
    rm ${section}
    ((n++))
done