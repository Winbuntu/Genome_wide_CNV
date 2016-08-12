#Use CNVkit draw heatmap
path: /labshares/fanlab/anqin/cfDNA_project/Genome_wide_CNV

## Remap data back to hg19
please see commit "re map with hg19"




##access file on github is not good

Use **access-5kb-mappable.hg19.bed**, which downloaded from Github

Download **refFlat.txt** from UCSC table broswer

Use **cnv_access.sh** to build target and antitarget file for hg19, save as ```./cnvkit_annot/refFlat_hg19.txt```

```
bgrun -m a -n TARGET "sh ./cnv_access.sh"
```

## Regenerate hg19 access file
Download excluible region from ftp://hgdownload.soe.ucsc.edu/goldenPath/hg19/encodeDCC/wgEncodeMapability/wgEncodeDukeMapabilityRegionsExcludable.bed.gz

refFlat.txt, **DO NOT add # lines**

Use qrsh to specify node run on.

## For each sample, generate cnn file



##Regenerate cns files for heatmap drawing
