# Lab Report: Comparison of Transcriptomic and Proteomic Data using R

**Author:** Syuzanna Matevosyan \
**Date:** May 27, 2022

## Introduction

This lab report presents the analysis of transcriptomic and proteomic data from healthy (control) and dystrophin-deficient (DMD) cardiomyocytes in humans. The aim of this analysis is to assess the consistency of results between proteomic and transcriptomic data. Specifically, we compare a list of genes with fold changes (Fch) and adjusted p-values from the transcriptomic analysis to a list of proteins, also characterized by fold changes and p-values, from the proteomic analysis. 

The following questions are addressed in this analysis using R scripts:

- How many records are common in both lists?
- How many of these records show consistent regulation (up-regulated gene corresponds to higher protein levels, down-regulated gene corresponds to lower protein levels)?
- How many of these records are significant (adjusted p-value < 0.05) in both the protein and gene data, only in the protein data, or only in the transcript data?
- What is the correlation of fold changes for consistent genes-proteins, i.e., if a gene's fold change is 2, is the protein level also 2 times higher?
- What is the correlation for each gene between mRNA and protein levels across samples (using Spearman or Pearson correlation)? The analysis also includes obtaining R-squared values and p-values, as well as visualizing the distribution of correlations.

## Procedure

The analysis was performed using the following R libraries: "readxl," "VennDiagram," "dplyr," "ggrepel," and "tidyverse."

### Data Loading and Cleaning

The data was loaded from the file "rna_seq_protein_data.xls" into two DataFrames: `df_proteomic` and `df_transcriptomic`. These DataFrames contained information about gene names, fold changes, and p-values.

The data was cleaned by removing rows with missing fold change or p-value values to retain only the relevant data.

### Identifying Common Genes

A list of common genes between the protein and transcript data was identified and stored in the `common_genes` object.

### Visualization

The "VennDiagram" library was used to create a Venn diagram to visualize the common genes between the protein and transcript data. The diagram showed that 3,856 records were common between the two datasets.

### Further Data Filtering

The data was further filtered to retain only the records belonging to common genes. New DataFrames, `df_proteomic` and `df_transcriptomic`, were created by collecting all common records. These DataFrames were sorted to match the order of common genes.

### Grouping Data

The data was separated into three groups based on fold change values:

1. High regulated genes (positive fold change in both transcriptomic and proteomic data).
2. Low regulated genes (negative fold change in both transcriptomic and proteomic data).
3. Different regulation (positive in one data and negative in the other).

Subgroups within the "different regulation" category were also identified:

3.1. Negative fold change in proteomic and positive fold change in transcriptomic.
3.2. Positive fold change in proteomic and negative fold change in transcriptomic.

### Correlation Analysis

The correlation between mRNA and protein levels across samples was calculated using linear regression. The R-squared value and p-value were obtained. The distribution of correlations was visualized using a scatter plot.

## Result

The analysis revealed that there was a poor correlation between mRNA and protein levels across samples, as indicated by a low R-squared value and a significant p-value (p-value <= 0.05). 

## Conclusion

In conclusion, the analysis of transcriptomic and proteomic data for cardiomyocytes in healthy and dystrophin-deficient individuals showed a weak correlation between mRNA and protein levels. This suggests that other factors may play a role in regulating protein expression beyond mRNA levels. Further investigations are needed to understand the underlying mechanisms responsible for the observed differences in gene regulation between transcriptomic and proteomic data.
