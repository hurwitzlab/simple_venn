setwd("/Users/Scott/Google Drive/Hurwitz Lab/dissertation figures and tables")

assembly_strains = read.delim("species from assembly",header=F)
gold_standard = read.delim("just-strain-list.txt",header=F)

strain_to_name = read.delim("tax_ids_to_lineage_ids.txt")

ngold_standard = merge(gold_standard,strain_to_name,by.x="V1",by.y="genome_id",all.x=T,all.y=F)

library(venneuler)
library(VennDiagram)

length(assembly_strains$V1)
length(assembly_strains$V1 %in% gold_standard$genome_name)

grid.newpage()
venn.plot <- draw.pairwise.venn(length(assembly_strains$V1), length(gold_standard$V1), length(assembly_strains$V1 %in% ngold_standard$genome_name), c("Assembly", "Gold standard"))
