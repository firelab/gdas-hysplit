#!/bin/bash

xargs -n 1 -a $1 -i wget -r -nH --cut-dirs=3 ftp://ftp.ncdc.noaa.gov/pub/has/model/{}/
