### Comparative Analysis of Proteomic and Transcriptomic Profiles in Dystrophin-Deficient Cardiomyocytes

**Author:** Syuzanna Matevosyan \
**Date:** May 27, 2022

### Experimental Design 

Experimental cohort consisted of two distinct groups: healthy individuals (control group) and individuals diagnosed with Duchenne Muscular Dystrophy (DMD group), characterized by the absence or a significant reduction in the dystrophin protein. Dystrophin is critical for maintaining the structural integrity of muscle cells, and its deficiency in DMD leads to progressive muscle degeneration and weakness.

![image](https://github.com/symatevo/DMD-Cardiomyocyte-Analysis/assets/74954267/40daec59-7bb8-49ef-aa0a-c133ddeda88b)

Each subject's cardiomyocytes were divided into two groups. 
These were labeled as 
- CTRL 1.1, CTRL 1.2 for the first healthy individual
- CTRL 2.1, CTRL 2.2 for the second healthy individual
- DMD 1.1, DMD 1.2 for the first DMD individual
- DMD 2.1, DMD 2.2 for the second DMD individual

### Data Analysis

1. Applying known sources batch correction such as differences attributable to individual donors and the specific time points at which samples were collected. 
2. Applying unknown batch effects such as surrogate variables (SV), individual donor variability, and time of sample collection, which are not immediately identifiable from the experimental metadata. 
3. Visualization of the data using Principal Component Analysis (PCA) and hierarchical clustering alongside a heatmap of gene expression (green for lower, red for higher expression).

![image](https://github.com/symatevo/DMD-Cardiomyocyte-Analysis/assets/74954267/eb683496-8b93-4f40-9655-5302fc1c513e)

The integrative analysis using PCA and hierarchical clustering presents a compelling narrative of the disease phenotype.


Illustration the standardized expression levels of genes found to be significantly different between the groups. This revealed distinct expression patterns across the genes.
red representing higher expression and blue indicating lower expression, corresponds to the gene expression z-scores between the control and diseased cardiomyocytes.

![image](https://github.com/symatevo/DMD-Cardiomyocyte-Analysis/assets/74954267/22b64451-107d-4f88-803d-b166591add9b)

The identification of these DE genes provides valuable insights into the molecular mechanisms underlying the disease and highlights potential therapeutic targets. For instance, the upregulation of genes involved in the stress response and downregulation of metabolic genes may reflect key aspects of the disease's impact on cardiomyocyte function.

### RNA-Seq vs. Proteomic

The following questions are addressed in this analysis using R scripts:
- How many records are common in both lists?
- How many of these records show consistent regulation (up-regulated gene corresponds to higher protein levels, down-regulated gene corresponds to lower protein levels)?
- How many of these records are significant (adjusted p-value < 0.05) in both the protein and gene data, only in the protein data, or only in the transcript data?
- What is the correlation of fold changes for consistent genes-proteins, i.e., if a gene's fold change is 2, is the protein level also 2 times higher?
- What is the correlation for each gene between mRNA and protein levels across samples (using Spearman or Pearson correlation)? The analysis also includes obtaining R-squared values and p-values, as well as visualizing the distribution of correlations.

### Analysis

A list of common genes between the protein and transcript data was identified and stored in the `common_genes` object.
The diagram showed that 3884 records were common between the two datasets.

![image](https://github.com/symatevo/DMD-Cardiomyocyte-Analysis/assets/74954267/6481d7fa-695c-42dc-a9dd-36c439ab9cc2)


The data was separated into three groups based on fold change values:

1. High regulated genes (positive fold change in both transcriptomic and proteomic data).
2. Low regulated genes (negative fold change in both transcriptomic and proteomic data).
3. Different regulation (positive in one data and negative in the other).

Subgroups within the "different regulation" category were also identified:

1. Negative fold change in proteomic and positive fold change in transcriptomic.
2. Positive fold change in proteomic and negative fold change in transcriptomic.

The correlation between mRNA and protein levels across samples was calculated using linear regression. The R-squared value and p-value were obtained. The distribution of correlations was visualized using a scatter plot.

![image](https://github.com/symatevo/DMD-Cardiomyocyte-Analysis/assets/74954267/be2b37da-9230-428b-91ee-d5badde7e314)

The analysis revealed that there was a poor correlation between mRNA and protein levels across samples, as indicated by a low R-squared value and a significant p-value (p-value <= 0.05). 
