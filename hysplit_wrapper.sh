#!/bin/bash

singularity exec -B /share/orchidee/gdas $HOME/singularity/hysplit/hysplit-4.2.0.simg $1
