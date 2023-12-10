library("xlsx")
library(VennDiagram)
library("readxl")
library("dplyr")
library("ggplot2")
df1 <- read_excel("rna_seq_protein_data.xls", sheet = 1)[,c(3,6,7)]
df2 <- read_excel("rna_seq_protein_data.xls", sheet = 2)[,c(1,3,6)]
list1 <- df1[[1]][1:4085]
list1 <- list1[!duplicated(list1)]
list2 <- df2[[1]][1:20812]
list2 <- list2[!duplicated(list2)]
common_name <- intersect(list1,list2)
common_name

df1 <- df1 %>% filter(Gene_names %in% common_name)
df1 <- df1[!duplicated(df1$Gene_names), ]
df1
df2 <- df2 %>% filter(GeneID %in% common_name)
df2
df1 <- df1 %>% arrange(factor(Gene_names, levels = common_name))
df2 <- df2 %>% arrange(factor(GeneID, levels = common_name))
df2
df1$fold_change_transcriptomic <- df2[[2]][1:3884]
df1$p_value_transcriptomic <- df2$padj
df1$positive <- (df1$`log2(fold_change)` > 0 & df1$fold_change_transcriptomic > 0)
df1$negative <- (df1$`log2(fold_change)` < 0 & df1$fold_change_transcriptomic < 0)
df1$differentfch <- !((df1$`log2(fold_change)` < 0 & df1$fold_change_transcriptomic > 0) | (df1$`log2(fold_change)` > 0 & df1$fold_change_transcriptomic < 0))
names(df1)[3] <- "Fold_change_proteomic"
names(df1)[2] <- "p_value_proteomic"
df1 <- df1 %>% na.omit

df1
df1 <- df1 %>% filter(differentfch == TRUE)
df1
df1$sign <- (df1$p_value_proteomic < 0.05 & df1$p_value_transcriptomic < 0.05)
df1$notsign <- (df1$p_value_proteomic > 0.05 & df1$p_value_transcriptomic > 0.05)
df1$differents <- !((df1$p_value_proteomic < 0.05 & df1$p_value_transcriptomic > 0.05) | (df1$p_value_proteomic > 0.05 & df1$p_value_transcriptomic < 0.05))
indexsameplus = which(df1$sign == TRUE)
nump = length(indexsameplus)
indexsameminus = which(df1$notsign == TRUE)
numm =  length(indexsameminus)
indexdif = which(df1$differents == FALSE)
numd = length(indexdif)
nump
numm
numd

df1 <- df1 %>% filter(differents == FALSE)
df1$onlyprot <- df1$p_value_proteomic < 0.05
df1$onlytrans <- df1$p_value_transcriptomic < 0.05
indexpp = which(df1$onlyprot == TRUE)
numpp = length(indexpp)
indexpt = which(df1$onlytrans == TRUE)
numpt = length(indexpt)
df1 <- df1 %>%
  mutate(Status = case_when(
    (onlyprot == TRUE) ~ numpp,
    (onlytrans == TRUE) ~ numpt,
  ))
df1$Status <- as.factor(df1$Status)
ggplot(df1, mapping = aes(x = Fold_change_proteomic, y = fold_change_transcriptomic, color = Status)) +
  geom_point() + geom_text(size = 2, hjust = 0, nudge_y = 0.05, aes(label = Gene_names)) + scale_color_manual(values=c("green", "red")) 
df1