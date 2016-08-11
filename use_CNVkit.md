#Use CNVkit draw heatmap
path: /labshares/fanlab/anqin/cfDNA_project/Genome_wide_CNV

## Remap data back to hg19
please see commit "re map with hg19"

## Regenerate hg19 access file
Use **access-5kb-mappable.hg19.bed**, which downloaded from Github

Download **refFlat.txt** from UCSC table broswer

Use **cnv_access.sh** to build target and antitarget file for hg19

```
bgrun -m a -n TARGET "sh ./cnv_access.sh"
```


##Regenerate cns files for heatmap drawing
