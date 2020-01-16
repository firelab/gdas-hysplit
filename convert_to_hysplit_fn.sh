#!/bin/bash

cnv=/opt/hysplit4/exec/api2arl_v4
#last_file=

convert_hysplit () 
{ 
    local d=$1
    local i_f=$2
    local timestamp=$3
    local last_file=$4
    local f=$(ls $d/gdas.t??z.pgrb2.0p25.f00$i_f)
    local of=gdas.$timestamp.f00$i_f
    if [ $i_f -eq 0 -a -e "$last_file" ] ;  then 
        local forecast_file_dir=$(dirname $last_file)
        local forecast_file=${forecast_file_dir}/$(basename $last_file .f005).f006
        echo Bootstrapping fluxes into file $of
        $cnv -z1 -i$forecast_file -o$of
        $cnv -z0 -i$f -o$of
    elif [ $i_f -ne 0 ] ; then
        echo $cnv -i$f -o$of
        $cnv -i$f -o$of
    fi 
}

#convert_hysplit ncep_global_ssi.2017090100 0 2017090100 ncep_global_ssi.2017083118/gdas.t18z.pgrb2.0p25.f005
#convert_hysplit ncep_global_ssi.2017082000 0 2017082000 ncep_global_ssi.2017081918/gdas.t18z.pgrb2.0p25.f005
#convert_hysplit ncep_global_ssi.2017080100 0 2017080100 ncep_global_ssi.2017073118/gdas.t18z.pgrb2.0p25.f005

#lf=ncep_global_ssi.2017071906/gdas1.t06z.pgrb2.0p25.f005
#for cyc in 12 18 ; do 
#    for hour in 0 1 2 3 4 5 ; do 
#        convert_hysplit ncep_global_ssi.20170719$cyc $hour 20170719$cyc $lf
#        lf=ncep_global_ssi.20170719${cyc}/gdas.t${cyc}z.pgrb2.0p25.f00$hour
#    done
#done

convert_hysplit ncep_global_ssi.2017072000 0 2017072000 ncep_global_ssi.2017071918/gdas.t18z.pgrb2.0p25.f005

