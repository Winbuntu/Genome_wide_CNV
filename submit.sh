qsub -l hostname="compute-0-6" -cwd -m n -V -N MP_hg19 -t 1-6:1 fastmappingwapper.sh 
qsub -l hostname="compute-0-14" -cwd -m n -V -N MP_hg19 -t 7-9:1 fastmappingwapper.sh
#qsub -l hostname="compute-0-6" -cwd -m n -V -N MP_hg19 -t 5-6:1 fastmappingwapper.sh
