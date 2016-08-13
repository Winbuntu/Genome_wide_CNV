
PYTHON="/share/apps/python2.7.6/bin/python"
cnvkit_dir="/home/qan/cnvkit/"

#ref_samples="16D-5-2_S8_L007_R1_001.fastq.gz_bwa_align_sorted_gpied_dedup_realign.bam	16D-6-1_S9_L008_R1_001.fastq.gz_bwa_align_sorted_gpied_dedup_realign.bam  16D-6-2_S10_L008_R1_001.fastq.gz_bwa_align_sorted_gpied_dedup_realign.bam"

#ref_samples="cf5.1_targetcoverage.cnn cf5.1_antitargetcoverage.cnn"

# step 1 For each sample, compute coverage on target and anti target. 
# target and antitarget are whole genome, using cnvkit
# $1 is bam $2 is sample name

$PYTHON ${cnvkit_dir}cnvkit.py reference g*targetcoverage.cnn -f /labshares/fanlab/anqin/REF/Hg19/Homo_sapiens/UCSC/hg19/Sequence/WholeGenomeFasta/genome.fa  -o cnvkit_annot/my_reference.cnn  -y

#$PYTHON ${cnvkit_dir}cnvkit.py coverage ${1} -o ${2}_antitargetcoverage.cnn  ${cnvkit_dir}Background.bed


