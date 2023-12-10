install.packages("xlsx")
install.packages("readxl")
install.packages("VennDiagram")
library("xlsx")
library(VennDiagram)
library("readxl")
df1 <- read_excel("rna_seq_protein_data.xls", sheet = 1)[,c(3)]
df2 <- read_excel("rna_seq_protein_data.xls", sheet = 2)[,c(1)]
list1 <- df1[[1]][1:4085]
print(list1)
list2 <- df2[[1]][1:20812]
print(list2)
colors <- c("#6b7fff", "#c3db0f")
venn.diagram(x = list(list1,list2),
             category.names = c("proteomic","transcriptomic"),
             filename = "final.png",
             col = "black",
             fill=colors,
             cat.col=colors,)
