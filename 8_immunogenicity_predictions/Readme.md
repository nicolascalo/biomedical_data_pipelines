# :bangbang: Disclaimer

Due to the proprietary nature of the code of this immunogenicity prediction pipeline, I am only able to provide preprocessing scripts and exemples of raw/processed/analyzed data for molecules included in public repositories.

# :paintbrush: Graphical summary

<img width="1859" height="675" alt="image" src="https://github.com/user-attachments/assets/44d77aef-105d-4d4f-9f0a-788830743834" />


# :exclamation: Situation

All biologics destined to be used as drugs for human patients have an inherent risk of triggering an immune response in their users. The immune system monitors the presence of foreign/non-self antigens in the body through antigen-presenting cells that phagocyte and digest protein/peptides from their environment, load them on MHC class II, and show them to T lymphocytes. Lymphocyte activation will occur upon good complementarity between their T-cell receptors and the presented peptide.

As biologics usually contain engineered sequences or Complementarity-Determining Regions (CDRs) (in antibodies) that are not naturally expressed by the host, they have a risk of inducing an immune reaction towards them. Potential outcomes of such a reaction can include neutralizing antibodies and loss of efficacy, altered pharmacokinetics or even severe immune reactions. Therefore, it is valuable to have the ability to flag drug sequences with high immunogenicity risk as part of a drug discovery campaign.

MHC-II will preferably present digested peptides that have a good complementarity with the pockets of the groove they contains. Machine learning algorithms based on experimental data are now able to predict in silico the strength of interaction between a sequence of interest and the major variants of MHC-II found in the human population. CROs can charge up to 1000$ for the in silico analysis of a single sequence, which prevent using their service for routine immunogenicity assessment of leads at the optimization stage.

https://en.wikipedia.org/wiki/Immunogenicity

# :ballot_box_with_check: Task

Creating an analysis pipeline for the immunogenicity prediction of protein sequences with the following requirements :
- Regularly updated prediction tool with possibility to licence the technology for commercial use
- Reproducibility of the analysis
- Automated data processing and result analysis
  - Sequences from public repositories to establish baselines
  - Proprietary sequences

# :point_right: Action

## :computer: Regularly updated prediction tool with possibility to licence the technology for commercial use

- NetMHCIIpan
  - https://services.healthtech.dtu.dk/services/NetMHCIIpan-4.3/
- Bash/Unix for NetMHCIIpan pipeline orchestration
- R for NetMHCIIpan data processing

## :male_detective: Reproducibility of the analysis and traceability of the raw data

- Analysis parameter included in the processed result files
- List of origin included in the name of the individual files
- Intermediary analysis steps saved as text files

## :gear::chart_with_upwards_trend: Automated data processing and result analysis

### :microscope: Data mining from public repositories

- chEMBL
  - https://www.ebi.ac.uk/chembl/api/data/molecule?
  - Querry for approved biotherapeutics
  - Removal of withdrawn drugs
- IMGT/mAb-DB
  - Retrieval of antibody species

### :twisted_rightwards_arrows: Pre-processing

- Splitting of combined .fasta files into a single file for each sequence

### :abacus: Protein sequence immunogenicity prediction

- NetMHCIIpan analysis of the sequences
- Processing of the result files to merge tables of each HLA variant 
- Calculation of a composite total score and hotspot score for the full protein depending on the predicted strength of interaction across the full sequence with the different HLA variants

# :bar_chart: Results

- Total and hotspot score for each analyzed protein sequence  

# :arrow_right::arrow_right::arrow_right: Pipeline input, output and parameters

## :inbox_tray: Input

- Sequence list as combined or individual .fasta files

## :outbox_tray: Output

- .csv file with NetMHCIIpan analysis parameters and total/hotspot score for each sequences
