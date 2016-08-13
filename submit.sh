# qsub  -cwd -m n -V -N MP_hg19_RA -t 1-9:1 fastmappingwapper_realign.sh 
qsub -l hostname="compute-0-6" -cwd -m n -V -N CNRS -t 1-6:1 fastmappingwapper_cnrs.sh 
#qsub -l hostname="compute-0-6" -cwd -m n -V -N MP_hg19 -t 5-6:1 fastmappingwapper.sh
