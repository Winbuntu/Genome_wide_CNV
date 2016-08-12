if [ ! -d "/tmp" ]; then
  mkdir /tmp
fi

GATK="/home/qan/GenomeAnalysisTK-3.6/GenomeAnalysisTK.jar"

# alignment $1 is first pair , $2 is second pair
# $3 is name, ${4} a number

#bwa mem -t 14  /labshares/fanlab/anqin/REF/Hg19/Homo_sapiens/UCSC/hg19/Sequence/BWAIndex/genome.fa  ${1} ${2} > ${3}_hg19_bwa_align.sam







# add group information
#/home/qan/jdk1.8.0_77/bin/java -Djava.io.tmpdir=`pwd`/tmp -jar /home/qan/picard-tools-2.1.1_03282016/picard.jar  AddOrReplaceReadGroups \
#	I=${3}_hg19_bwa_align.sam \
#	O=${3}_hg19_bwa_align_gpi.bam \
#	RGID=${4} \
#	RGLB=lib1 \
#	RGPL=illumina \
#	RGPU=unit1 \
#	RGSM=${4}


#rm ${1}_bwa_align.sam

#bug fixed
#samtools sort -@ 10  ${3}_hg19_bwa_align_gpi.bam  ${3}_hg19_bwa_align_sorted_gpied

#rm ${1}_bwa_align_gpi.bam

# mark duplicates
#/home/qan/jdk1.8.0_77/bin/java -Djava.io.tmpdir=`pwd`/tmp -jar /home/qan/picard-tools-2.1.1_03282016/picard.jar  MarkDuplicates \
#	I=${3}_hg19_bwa_align_sorted_gpied.bam \
#	O=${3}_hg19_bwa_align_sorted_gpied_dedup.bam \
#	M=${3}marked_dup_metrics.txt

#rm ${1}_bwa_align_sorted_gpied.bam


#build bam index
#/home/qan/jdk1.8.0_77/bin/java -Djava.io.tmpdir=`pwd`/tmp -jar /home/qan/picard-tools-2.1.1_03282016/picard.jar BuildBamIndex  I=${1}_bwa_align_sorted_gpied_dedup.bam OUTPUT=${1}_bwa_align_sorted_gpied_dedup.bam.bai

#samtools index ${3}_hg19_bwa_align_sorted_gpied_dedup.bam




#Create realignment targets
#/home/qan/jdk1.8.0_77/bin/java -Xms6G -Xmx8G  -jar $GATK -T RealignerTargetCreator -nct 1 -nt 24 -R /labshares/fanlab/anqin/REF/Hg38/Homo_sapiens/UCSC/hg38/Sequence/WholeGenomeFasta/genome.fa  \
#       -I ${1}_bwa_align_sorted_gpied_dedup.bam  \
#       -o ${1}.targetintervals.list


#Indel realignment
#/home/qan/jdk1.8.0_77/bin/java  -jar $GATK -T IndelRealigner \
#       -R /labshares/fanlab/anqin/REF/Hg38/Homo_sapiens/UCSC/hg38/Sequence/WholeGenomeFasta/genome.fa  \
#       -I ${1}_bwa_align_sorted_gpied_dedup.bam  \
#       -targetIntervals ${1}.targetintervals.list \
#       -o ${1}_bwa_align_sorted_gpied_dedup_realign.bam

#rm ${1}_bwa_align_sorted_gpied_dedup.bam


#MuTect2 call

if [ ! -d "${3}_baseQ_28" ]; then
  mkdir ${3}_baseQ_28
fi

/home/qan/jdk1.8.0_77/bin/java  -Xms6G -Xmx8G  -jar $GATK -T  MuTect2 \
        --min_base_quality_score 28 \
        -R /labshares/fanlab/anqin/REF/Hg38/Homo_sapiens/UCSC/hg38/Sequence/WholeGenomeFasta/genome.fa \
        -I:tumor ${1} \
        -I:normal ${2} \
        -L ${4} \
        -o ./${3}_baseQ_28/${3}_${4}.vcf



