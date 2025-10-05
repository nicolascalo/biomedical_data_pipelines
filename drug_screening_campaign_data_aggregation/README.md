# Disclaimer

The file included in this folder has been anonimized, which introduced some artifacts in the final document

# Graphical summary

<img width="2000" height="447" alt="496859446-e56b0fa3-a69c-4b84-a99b-736a2d7b0803" src="https://github.com/user-attachments/assets/b8af36f1-b5a4-48fd-b990-bc9095f2e0f5" />

# Situation

Over a drug discovery campaign, hundreds if not thousands of dose-response curves are generated in order to establish a complete dataset. It is then usefull to generate a structured document gathering both the aggregated and individual experimental data for easy sharing and reviewing by decision makers and coworkers.


# Task

Creating an analysis pipeline for the aggregation and integration of individual drug screening experiments answering the following requirements:
- Open source and free-to-use software ecosystem
- Reproducibility of the analysis and traceability of the raw data
- Automated data processing and compilation of the results in a single master pdf file

  
# Action


## Open source and free-to-use software ecosystem

- R and RStudio (for parametrized R-markdown reporting)
- LaTex-based pdf generation
- ggplot2 for static graphs

## Reproducibility and traceability of results 

- Complete compilation of all individual dose response curves and associated metrics, along with traceability information for the contained individual experiments

## Data processing and display

- Normalization of individual experimental using included positive and negative controls
- Automated determination of the concentration range to integrate
- Statistics computation for biological replicates
- Compound clustering according to their agonistic and antagonistic properties
- Various representations of the aggregated data (tables, graphs)
- Exhaustive graphing of all the individual dose-response curves in regard to their respective controls

# Results

A single bookmarked .pdf file containing the integrated data and associated classification/statistics, along with the underlying dose-response curves and their metrics used to compute these statistics

# Pipeline input and output

## Input

- Processed .txt files obtained by the screening data analysis pipeline
- Choice of parameters for the analysis (if defaults need to be overwritten)

## Output

- Bookmarked pdf document report containing:
  - Title page
  - Table of contents
  - Global Summaries
    - Agonist mode vs Antagonist mode integration
    - Analysis of agonist mode only
  - Super-agonists, Analysis of agonist mode only
    - Summaries
    - Dose-response curves
  - Super-agonists, Agonist mode vs antagonist mode integration
    - Summaries
	  - Dose-response curves
  - Antagonists, Agonist mode vs antagonist mode integration
    - Summaries
	  - Dose-response curves
  - Quality control
  - Dose-response curves, all conditions
    - Dose-response curves, mean +/- SEM
    - Dose-response curves, dot plots
  - Dose-response curves, all conditions, agonist mode only
    - Dose-response curves, mean +/- SEM
    - Dose-response curves, dot plots
  - Summary tables, all conditions
  - Heat maps
    
- .csv files for the processed data

