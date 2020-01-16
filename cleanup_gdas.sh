#!/bin/bash

#
# Running out of space, so deleting the largest files I'm not using yet. 
# Would delete everything I'm not using, but keeping the majority of it just 
# in case I later discover I need it.
#
# These are the biggest files by size.  
#
#7188504 ncep_global_ssi.2017081812/gdas.t12z.atmf009.nemsio
#7188504 ncep_global_ssi.2017081812/gdas.t12z.atmf006.nemsio
#7188504 ncep_global_ssi.2017081812/gdas.t12z.atmf003.nemsio
#7188504 ncep_global_ssi.2017081812/gdas.t12z.atmf000.nemsio
#7188504 ncep_global_ssi.2017081812/gdas.t12z.atmanl.nemsio
#2570700 ncep_global_ssi.2017081812/gdas.t12z.radstat


for d in ncep_global* ; do 


    ls $d | grep -E -e "^gdas1?\.t[0-9]{2}z\.sf0[0369]$" \
                    -e "^gdas\.t[0-9]{2}z\.atmf00[0369]\.nemsio" \
                    -e "^gdas\.t[0-9]{2}z\.atmanl\.nemsio" \
                    -e "^gdas1?\.t[0-9]{2}z\.sanl" \
                    -e "^gdas1?\.t[0-9]{2}z\.radstat" \
          | xargs -n 1 -i rm $d/{} 

done
