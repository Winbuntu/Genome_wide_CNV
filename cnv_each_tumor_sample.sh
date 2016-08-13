
PYTHON="/share/apps/python2.7.6/bin/python"
cnvkit_dir="/home/qan/cnvkit/"

#ref_samples="16D-5-2_S8_L007_R1_001.fastq.gz_bwa_align_sorted_gpied_dedup_realign.bam	16D-6-1_S9_L008_R1_001.fastq.gz_bwa_align_sorted_gpied_dedup_realign.bam  16D-6-2_S10_L008_R1_001.fastq.gz_bwa_align_sorted_gpied_dedup_realign.bam"

#ref_samples="cf5.1_targetcoverage.cnn cf5.1_antitargetcoverage.cnn"

# step 3 For each tumor sample... 
# target and antitarget are whole genome, using cnvkit
# $1 is target  $2 is antitarget name, $3 sample name

$PYTHON ${cnvkit_dir}cnvkit.py fix ${1} ${2} /labshares/fanlab/anqin/cfDNA_project/Genome_wide_CNV/cnvkit_annot/my_reference.cnn  -o ${3}.hg19.cnr 

$PYTHON ${cnvkit_dir}cnvkit.py segment ${3}.hg19.cnr -o ${3}.hg19.cns

#$PYTHON ${cnvkit_dir}cnvkit.py coverage ${1} -o ${2}_antitargetcoverage.cnn  ${cnvkit_dir}Background.bed


