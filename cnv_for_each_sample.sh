#!/bin/bash
PYTHON="/share/apps/python2.7.6/bin/python"
cnvkit_dir="/home/qan/cnvkit/"

# ${1} to be the bam file
# this script generate cnn files for each sample

#cnvkit.py coverage Sample.bam my_targets.bed -o Sample.targetcoverage.cnn
#cnvkit.py coverage Sample.bam my_antitargets.bed -o Sample.antitargetcoverage.cnn

$PYTHON ${cnvkit_dir}cnvkit.py coverage  ${1} /labshares/fanlab/anqin/cfDNA_project/Genome_wide_CNV/cnvkit_annot/Targets_hg19.bed -o ${1}.hg19.targetcoverage.cnn

$PYTHON ${cnvkit_dir}cnvkit.py coverage  ${1} /labshares/fanlab/anqin/cfDNA_project/Genome_wide_CNV/cnvkit_annot/Background_hg19.bed -o ${1}.hg19.antitargetcoverage.cnn
