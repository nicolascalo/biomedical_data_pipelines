# :bangbang: Disclaimer

Due to the confidential nature of this work, I am not able to provide raw data, detailed sample annotations or files from intermediary processing steps, as the data they contain (such as DNA or protein sequences) could be used to identify the target/ligand being studied. Nonetheless, graphical summaries of NGS data processing and an exemple of clone enrichment analysis is provided.   

# :paintbrush: Graphical summary

<img width="1664" height="681" alt="image" src="https://github.com/user-attachments/assets/697fb9af-5e38-46d5-85a3-582e0beca7a9" />

# :exclamation: Situation

The drug discovery platform I belonged to used phage display technology to engineer and select new drug candidates for a receptor of interest.

Phage display requires the generation of a plasmid library encoding the ligand of interest whose protein sequence has been randomized on selected regions of interest. Phages derived from such a library are then selected for their binding affinity on their target of interest over rounds of phage display selection, recovered and sequenced to identify which displayed protein seuqences resulted in the best binding.

<img width="1920" height="1222" alt="image" src="https://github.com/user-attachments/assets/437a8508-e2cf-4ad4-8b0b-d942a127b811" />
By Thomas Shafee - Own work, CC BY 4.0, https://commons.wikimedia.org/w/index.php?curid=79128254
<br />
<br />
Using high-throughput sequencing on these libraries allows to titrate in an unbiased and comprehensive manner the different clones over rounds, and to identify putative drug candidates based on their eventual enrichment among the whole phage population. 

# :ballot_box_with_check: Task

Creating an analysis pipeline for the automated processing of DNA libraries from Next Generation Sequencing (NGS) answering the following requirements:
- Free-to-use software ecosystem and Windows operating system compatibility
- Reproducibility of the analysis and traceability of the raw data
- Automated data processing and result analysis
  - Data from Illumina MiSeq systems with ~ 20 million of 300-600 bp paired reads per sample
  - <img width="1753" height="508" alt="image" src="https://github.com/user-attachments/assets/a452b55e-2c87-4475-8ae7-c7ac4028532f" />
  - Libraries with multiplexed samples/targets/ligands
  - "Generic" pipeline applicable to any DNA library using the pHEN plasmid backbone
- Sequence quality check 

# :point_right: Action

## :computer: Open source and free-to-use software ecosystem

- BBtools for the bioinformatics tools
  - https://github.com/bbushnell/BBTools
  - https://bbmap.org/
- R for pipeline orchestration
- Plotly for interactive representation of the data

## :male_detective: Reproducibility of the analysis and traceability of the raw data

- Primer/adapter/sequence info necessary for the analysis provided in an accessory excel spreadsheet 
- Tracking of the data origin in the output tables
- Intermediary analysis steps saved as text files

## :gear::chart_with_upwards_trend: Automated data processing and result analysis

### :twisted_rightwards_arrows: Pre-processing
<img width="1649" height="750" alt="image" src="https://github.com/user-attachments/assets/ef9d72bb-9a8a-44f3-9018-6fffe738895f" />

- Read pairing
- Quality checks of insert-decorating adapter/primer/barcode/Unique Molecular Identifier (UMI) sequences
- Sample sorting based on barcode sequence
- Sequence deduping based on UMI
- Trimming of adapter/primer/barcode/UMI sequences

### :abacus: Insert sequence analysis
<img width="1698" height="769" alt="image" src="https://github.com/user-attachments/assets/a3288664-d527-430a-b6d0-2e3aa46df19b" />

- DNA frameshift analysis
- Translation to protein sequence
- Expected protein backbone comparison (contamination check)
- Stop codon identification
- Extraction of the target diversity protein sequence
- Tally of the different sequence
- Imputation of missing values (if clone detected in previous output but not in current input)
- Normalization of data versus the library size
- Calculation of sequence enrichment within each round (output/input)
- Calculation of overall sequence enrichment round over round
- Flagging of sequences consistently enriched in all rounds
- Sequence matching to know analogs

# :bar_chart: Results

Fully self-contained interactive html report allowing easy exploration and sharing of raw and processed data by the user.

# :arrow_right::arrow_right::arrow_right: Pipeline input, output and parameters

## :inbox_tray: Input

- Raw .fastq files from the DNA sequencing provider
- Excel spreadsheet with library details:
  - Sample list with corresponding barcodes, primer sequences, sample annotation, etc.

## :outbox_tray: Output

- Interactive html graphing of the data processing and results clustered by:
  - Sequencing run
  - Drug discovery campaign - DNA sequence analysis
  - Drug discovery campaign - Protein sequence analysis
- Intermediary processing files
- Quality check reports (e.g., FastQC) of all the analyzed sequences
- Analysis results exported as .txt files
- Plots of phage abundance and enrichment over the sequencing rounds
