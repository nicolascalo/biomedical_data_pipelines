
# Graphical summary



# Situation

The drug discovery platform I belonged to used phage display technology to engineer and select new drug candidates for a receptor of interest.

Phage display requires the generation of a plasmid library encoding the ligand of interest whose protein sequence has been randomized on selected regions of interest. It is then necessary to check the library quality using Sanger sequencing on individualy recovered phage clones.

Manual processing of data involved sample-by-sample trimming of the DNA sequence, translation into amino acid sequence, and quality check of the results upstream and downstream of the plasmid insert. This process was time consuming and error-prone when handling dozens or hundreds of sequences. 

# Task

Creating an analysis pipeline for the automated processing of individual DNA sequences from Sanger sequencing answering the following requirements:
- Open source and free-to-use software ecosystem
- Ease of use for users with limited skills in computers use
- Reproducibility of the analysis and traceability of the raw data
- Automated data processing and interactive display of the results

# Action

## Open source and free-to-use software ecosystem

- R and RStudio (for parametrized R-markdown reporting)
- DT for interactive tables

## Ease of use for users with limited skills in computers use

- "One click" analysis of the results
- Direct processing of unmodified .fasta raw data files from the sequencing provider
- No file renaming needed
- Possibility of using a sub-folder structure to organize the datasets
- Minimal script modification by the user (plasmid backbone definition and name of the analysis)
- Output of a software-unbound html interactive report that contains the complete analysis
- Automated installation of needed packages and dependencies
- Possibility to choose which columns to display and how many entries
  - <img width="958" height="79" alt="image" src="https://github.com/user-attachments/assets/c0b4c882-8545-4657-9848-cb75a7e11bc0" />
- Table filtering
- Possibility to copy and export displayed tables directly from the report as .xls, .csv or .pdf files
  - <img width="308" height="43" alt="image" src="https://github.com/user-attachments/assets/3345cb2a-bdc8-4240-96ae-7074ec8358ff" />
- Search bar for quick data retrieval on the whole table
  - <img width="293" height="52" alt="image" src="https://github.com/user-attachments/assets/452036f1-7465-451e-a4b7-d775eab4ae5f" />
- Addition of the unmodified protein backbone to the result set for easy comparison
- Automated protein sequence alignment

## Reproducibility of the analysis and traceability of the raw data

- Embedding of the raw data with corresponding raw file names and source code inside the report (not available on the exemple files of this repository)
- Details of all the processing steps

## Automated data processing and interactive display of the results

### Tables for:
- Sequences belonging to the backbone of interest (XXXX-based clones)
- Non-functional sequences (Junk clones)


#### Visble by default
- Analog Name (if found in the internal script database) 
- Vector Type (if found in the internal script database) 
- Backbone of the sequence :
  - If sequence contained in the internal script database
  - If frameshift of a sequence contained in the internal script database 
- File Name
- File Folder
- Sequencing Primer (imputed from the file name)
- Warnings about the amino acid sequence:
  - Uneven number of cysteins
  - Ambiguous AA found in the sequence
  - Phage sequence not found
  - Empty plasmid
  - Protein backbone not matching the reference protein
  - Insert promoter not found in the sequence
- Replicates Global:
  - Number of amino acid sequence replicates in the whole dataset
- Chemical Replicates Global:
  - Number of sequence replicates in the whole dataset based on amino acid physico-chemical properties
- Sequence position where there is amino acid diversity

#### Hidden by default
- File Type
- Sequencing Plate (imputed from the file name)
- Sequence Dna
  - DNA sequence from the raw data files 
- Sequence Dna Trimmed
  - Plasmid insert DNA sequence 
- Insert protein sequence
- Peptide grouping based on raw amino acid sequence
- Peptide grouping based on amino acid physico-chemical properties
- Aligned protein sequence

# Results

Fully self-contained interactive html report allowing easy exploration and sharing of raw and processed data by the user.

# Pipeline input and output

## Input

- Raw .fasta files from the DNA sequencing provider (organized in subfolders if desired)
- Name of the protein backbone (to modify inside the script before running it)
- Name of the analysis (to modify inside the script before running it)

## Output

- Html report
- Tables exported as .tsv files
