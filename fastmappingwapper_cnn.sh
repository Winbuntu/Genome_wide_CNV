#!/bin/bash
# myFunc2FastWrapper.sh
echo $SGE_TASK_ID
sh ./cnv_for_each_sample.sh  `sed -n ${SGE_TASK_ID}p Thegpied_dedup.bam.txt`
