#!/bin/bash
# myFunc2FastWrapper.sh
echo $SGE_TASK_ID
sh ./cnv_each_tumor_sample.sh  `sed -n ${SGE_TASK_ID}p cnn_files.txt`
