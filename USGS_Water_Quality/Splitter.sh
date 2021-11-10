#!/bin/bash

FILENAME="USGSWaterQualityWaterQuality.csv"
FILESIZE=20MB

HEADER=$(head -1 ${FILENAME})
split --bytes=${FILESIZE} ${FILENAME} USGS_Water_Quality_
n=1
for section in USGS_Water_Quality_*
do
    echo ${HEADER} > USGSWaterQuality_$(printf "%03d\n" ${n}).csv
    sed -i '1d' ${section}
    cat ${section} >> USGSWaterQuality_$(printf "%03d\n" ${n}).csv
    rm ${section}
    ((n++))
done