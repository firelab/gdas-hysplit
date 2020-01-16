#!/bin/bash

cnv=/opt/hysplit4/exec/api2arl_v4
#last_file=
last_file=ncep_global_ssi.2017052818/gdas1.t18z.pgrb2.0p25.f005

for d_i in $(seq -f "%02.f" 28 31) ; do 
    for d in $(ls -d ncep_global_ssi.201705${d_i}??) ; do
        timestamp=$(echo $d | cut -c 17-) 
        for i_f in {0..5} ; do 
            f=$(ls $d/gdas1.t??z.pgrb2.0p25.f00$i_f)
            of=gdas.$timestamp.f00$i_f
            if [ $i_f -eq 0 -a -e "$last_file" ] ;  then 
                forecast_file_dir=$(dirname $last_file)
                forecast_file=${forecast_file_dir}/$(basename $last_file .f005).f006
                echo Bootstrapping fluxes into file $of
                $cnv -z1 -i$forecast_file -o$of
                $cnv -z0 -i$f -o$of
            elif [ $i_f -ne 0 ] ; then
                echo $cnv -i$f -o$of
                $cnv -i$f -o$of
            fi 
            last_file=$f
        done
    done
done 


