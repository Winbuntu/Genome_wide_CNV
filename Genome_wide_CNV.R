library(ggplot2)

chr.names = paste("chr",c(1:22,"X","Y"),sep="")


generate.cnv.plot<- function(sample.file){
cns.data = read.table(sample.file,head=T)

cns.data = cns.data[which(as.character(cns.data$chromosome) %in% chr.names),  ]

cns.data$pos = c(1:nrow(cns.data))


cns.data$width = cns.data$end - cns.data$start

pdf(file = paste(sample.file,"pdf",sep="."),width = 10,height = 5)
barplot( (2^(cns.data$log2)-1), col=cns.data$chromosome   ,
         ylim=c(-1,6),width = cns.data$width , border =   cns.data$chromosome     )

title(sample.file)
dev.off()
}

generate.cnv.plot("cf1.1.cns")
generate.cnv.plot("cf1.2.cns")

generate.cnv.plot("cf2.1.cns")
generate.cnv.plot("cf2.2.cns")

generate.cnv.plot("cf3.1.cns")
generate.cnv.plot("cf3.2.cns")

#ggplot(cns.data, aes(chromosome, fill=chromosome)) + geom_bar(position="dodge")
