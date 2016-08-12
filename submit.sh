#qsub  -cwd -m n -V -N MP_hg19_FIX -t 1-6:1 fastmappingwapper.sh 
qsub -l hostname="compute-0-14" -cwd -m n -V -N CNN -t 1-9:1 fastmappingwapper_cnn.sh
#qsub -l hostname="compute-0-6" -cwd -m n -V -N MP_hg19 -t 5-6:1 fastmappingwapper.sh
