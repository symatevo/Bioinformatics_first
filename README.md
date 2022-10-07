# Bioinformatics_report

This Bioinformatics report was done in Laboratory of Bioinformatics and Genome Biology.



Analysis done on transcriptomic and proteomic data from healthy (control) and dystrophin-deficient (DMD) cardiomyocytes human(samples are from 2 patients). Applying data analysis methods to the transcriptomic and proteomic data of the same sample has the goal to check if the results from proteomics are consistent with the data from transcriptomic analysis. Having a list of genes (witch foldchange (Fch) and adjusted p-values) from the transcriptomic part where we compare disease vs. controls and a list of proteins (also characterized by foldchange and p-values) from the proteomic part where the same comparison was done. For this goal, using R scripts, the following questions were considered.

- how many records are common on both lists

- how many of them are consistent (up-regulated gene = higher protein level; down-regulated gene = lower protein level)

- how many of them are significant (adjusted p-value<0.05) botch on protein and gene/ only on protein or only on transcript level

- what is the correlation of fold-changes (for consistent genes-protein) e.g., if gene Fch=2 is protein level also 2-times higher

- what is the correlation for each gene between mRNA and protein levels across samples (i.e. spearman or pearson, get r^2 and pvalue, and see how is the distribution of correlations)

