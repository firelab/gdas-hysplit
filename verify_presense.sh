#!/bin/bash

#
# Quick script to check that the output files exist, and to print the ones which
# are missing. 
# 

if (( $# != 3 )) ; then 
    echo Usage: $0 [month] [day_start] [day_end]
    echo "Make sure you specify the month with two digits (include leading zero)"
    exit 0
fi

month=$1
day_start=$2
day_end=$3

for d in $(seq -f "%02.f" $day_start $day_end) ; do 
    for forecast_cycle in 00 06 12 18 ; do 
        for forecast_hour in {0..5} ; do
            filename=gdas.2017${month}${d}${forecast_cycle}.f00${forecast_hour}
            if [ ! -e $filename ] ; then 
                echo MISSING: $filename
            fi
        done
    done
done
            
