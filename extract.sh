#!/bin/bash

p=$(pwd)
datadir=$p/data
for d in HAS* ; do 
    cd $d
    echo DIR = $d
    for f in *.tar ; do 
        echo $f
        tardir=$(basename $f .tar)
        mkdir $datadir/$tardir
        tar xf $f -C $datadir/$tardir
    done
    cd $p
    mv $d download
done
