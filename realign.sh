if [ ! -d "/tmp" ]; then
  mkdir /tmp
fi

GATK="/home/qan/GenomeAnalysisTK-3.6/GenomeAnalysisTK.jar"

#Create realignment targets
/home/qan/jdk1.8.0_77/bin/java -Xmx4G  -jar $GATK -T RealignerTargetCreator -nct 1 -nt 24 -R /labshares/fanlab/anqin/REF/Hg19/Homo_sapiens/UCSC/hg19/Sequence/WholeGenomeFasta/genome.fa  \
       -I ${3}_hg19_bwa_align_sorted_gpied_dedup.bam  \
       -o ${3}.hg19.targetintervals.list

#Indel realignment
/home/qan/jdk1.8.0_77/bin/java   -Xmx4G -jar $GATK -T IndelRealigner \
       -R /labshares/fanlab/anqin/REF/Hg19/Homo_sapiens/UCSC/hg19/Sequence/WholeGenomeFasta/genome.fa  \
       -I ${3}_hg19_bwa_align_sorted_gpied_dedup.bam  \
       -targetIntervals ${3}.hg19.targetintervals.list \
       -o ${3}_hg19_bwa_align_sorted_gpied_dedup_realign.bam
