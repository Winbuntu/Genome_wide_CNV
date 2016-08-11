#!/bin/bash
PYTHON="/share/apps/python2.7.6/bin/python"
cnvkit_dir="/home/qan/cnvkit/"

$PYTHON ${cnvkit_dir}cnvkit.py  target ./cnvkit_annot/access-5kb-mappable.hg19.bed --split --annotate ./cnvkit_annot/refFlat.txt -o ./cnvkit_annot/Targets_hg19.bed 

$PYTHON ${cnvkit_dir}cnvkit.py antitarget ./cnvkit_annot/access-5kb-mappable.hg19.bed -g ./cnvkit_annot/access-5kb-mappable.hg19.bed -o ./cnvkit_annot/Background_hg19.bed
