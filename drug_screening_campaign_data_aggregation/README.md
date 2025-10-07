# :bangbang: Disclaimer

The file included in this folder has been anonimized, which introduced some artifacts in the final document

# :paintbrush: Graphical summary

<img width="2000" height="616" alt="image" src="https://github.com/user-attachments/assets/70dc05a0-df9e-4505-89ad-4be3f0b7e7b2" />

# :exclamation: Situation

Over a drug discovery campaign, hundreds if not thousands of dose-response curves are generated in order to establish a complete dataset.

It is then usefull to generate a structured document gathering both the aggregated and individual experimental data for easy sharing and reviewing by decision makers and coworkers.

# :ballot_box_with_check: Task

Creating an analysis pipeline for the aggregation and integration of individual drug screening experiments answering the following requirements:
- Open source and free-to-use software ecosystem
- Reproducibility of the analysis and traceability of the raw data
- Automated data processing and compilation of the results in a single master pdf file
  
# :point_right: Action

## :computer: Open source and free-to-use software ecosystem

- R and RStudio (for parametrized R-markdown reporting)
- LaTex-based pdf generation
- ggplot2 for static graphs

## :male_detective: Reproducibility and traceability of results 

- Complete compilation of all individual dose response curves and associated metrics, along with traceability information for the contained individual experiments

## :gear::chart_with_upwards_trend: Data processing and display

- Normalization of individual experimental using included positive and negative controls
- Automated determination of the concentration range to integrate
- Statistics computation for biological replicates
- Compound clustering according to their agonistic and antagonistic properties
- Various representations of the aggregated data (tables, graphs)
- Exhaustive graphing of all the individual dose-response curves in regard to their respective controls

# :bar_chart: Results

- A bookmarked .pdf file containing the integrated data and associated classification/statistics, along with the underlying dose-response curves and their metrics used to compute these statistics
- Ability for the drug discovery plat-form to obtain a single master document for each screening campaign that can drive decision making

# :arrow_right::arrow_right::arrow_right: Pipeline input and output

## :inbox_tray: Input

- Processed .txt files obtained by the screening data analysis pipeline
- Choice of parameters for the analysis (if defaults need to be overwritten)

## :outbox_tray: Output

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

