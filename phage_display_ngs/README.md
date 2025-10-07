
# Graphical summary


# Situation

The drug discovery platform I belonged to used phage display technology to engineer and select new drug candidates for a receptor of interest.

Phage display requires the generation of a plasmid library encoding the ligand of interest whose protein sequence has been randomized on selected regions of interest. Phages derived from such a library are then selected for their binding affinity on their target of interest over rounds of phage display selection, recovered and sequenced to identify which displayed protein seuqences resulted in the best binding.

Using high-throughput sequencing on these libraries allows to follow in an unbiased and comprehensive manner the prevalence over rounds of the different clones, and to identify putative drug candidates based on their eventual enrichment among the whole phage population. 

# Task

Creating an analysis pipeline for the automated processing of DNA libraries from Next Generation Sequencing (NGS) answering the following requirements:
- Free-to-use software ecosystem and Windows operating system compatibility
- Reproducibility of the analysis and traceability of the raw data
- Automated data processing and result analysis
  - Data from Illumina MiSeq systems with ~ XXX million of 300-400 bp paired reads per sample
  - Libraries with multiplexed samples/targets/ligands
  - "Generic" pipeline applicable to any DNA library using the pHEN plasmid backbone
- Sequence quality check 

# Action

## Open source and free-to-use software ecosystem

- BBtools for the bioinformatics tools
  - https://github.com/bbushnell/BBTools
  - https://bbmap.org/
- R and RStudio for pipeline orchestration
- Plotly for interactive representation of the data

## Reproducibility of the analysis and traceability of the raw data

- Primer/adapter/sequence info necessary for the analysis provided in an accessory excel spreadsheet 
- Tracking of the data origin in the output tables
- Intermediary analysis steps saved as text files

## Automated data processing and result analysis

### Pre-processing
- Read pairing
- Quality checks of insert-decorating adapter/primer/barcode/Unique Molecular Identifier (UMI) sequences
- Sample sorting based on barcode sequence
- Sequence deduping based on UMI
- Trimming of adapter/primer/barcode/UMI sequences

### Insert sequence analysis

- DNA frameshift analysis
- Translation to protein sequence
- Expected protein backbone comparison (contamination check)
- Stop codon identification
- Extraction of the target diversity protein sequence
- Tally of the different sequence
- Imputation of missing values if detected in the output of the previous round but not in the input of the next one
- Normalization of data versus the library size
- Calculation of sequence enrichment within each round (output/input)
- Calculation of overall sequence enrichment round over round
- Flagging of sequences consistently enriched in all rounds
- Sequence matching to know analogs

# Results

Fully self-contained interactive html report allowing easy exploration and sharing of raw and processed data by the user.

# Pipeline input and output

## Input

- Raw .fastq files from the DNA sequencing provider
- Excel spreadsheet with library details:
  - Sample list and corresponding barcodes
  - ...

## Output

- Interactive html graphing of the data processing and results clustered by:
  - Sequencing run
  - Drug discovery campaign - DNA sequence analysis
  - Drug discovery campaign - Protein sequence analysis
- Intermediary processing files
- Quality check reports of all the anaylzed sequences
- Analysis results exported as .tsv files
