#!/bin/bash
# myFunc2FastWrapper.sh
echo $SGE_TASK_ID
sh ./realign.sh  `sed -n ${SGE_TASK_ID}p files_to_map.txt`
