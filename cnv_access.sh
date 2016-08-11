#!/bin/bash
PYTHON="/share/apps/python2.7.6/bin/python"
cnvkit_dir="/home/qan/cnvkit/"

$PYTHON ${cnvkit_dir}cnvkit.py access /labshares/fanlab/anqin/REF/Hg19/Homo_sapiens/UCSC/hg19/Sequence/WholeGenomeFasta/genome.fa -x ./cnvkit_annot/wgEncodeDukeMapabilityRegionsExcludable.bed -o ./cnvkit_annot/access-5k-mappable.hg19.bed  

$PYTHON ${cnvkit_dir}cnvkit.py  target ./cnvkit_annot/access-5k-mappable.hg19.bed  --split  -o ./cnvkit_annot/Targets_hg19.bed --annotate ./cnvkit_annot/refFlat_hg19.txt 

$PYTHON ${cnvkit_dir}cnvkit.py antitarget ./cnvkit_annot/access-5k-mappable.hg19.bed -g ./cnvkit_annot/access-5k-mappable.hg19.bed -o ./cnvkit_annot/Background_hg19.bed
