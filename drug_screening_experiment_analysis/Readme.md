# :paintbrush: Graphical summary

<img width="2000" height="551" alt="image" src="https://github.com/user-attachments/assets/235e9646-6d7d-4b79-af7e-8bdf2ae74fcc" />

# :exclamation: Situation

The drug discovery platform I belonged to had recently transitioned from low- to high-throughput pharmacological screening for its drug candidates. Manual processing of the screening data had become unsustainable (one week of work for a single experiment), warranting the development of an automated data processing and analysis pipeline. 

# :ballot_box_with_check: Task

Creating an analysis pipeline for the processing of individual drug screening experiments answering the following requirements:
- Open source and free-to-use software ecosystem
- Ease of use for users with limited skills in computers use but possibility of tuning the parameters of the analysis
- Reproducibility of the analysis and traceability of the raw data
- Automated data processing and interactive display of the results
  
# :point_right: Action

## :computer: Open source and free-to-use software ecosystem

- R and RStudio (for parametrized R-markdown reporting)
- Plotly for interactive graphs
- ggplot2 for static graphs
- DT for interactive tables

## :girl::boy: Ease of use for people uncomfortable with computers

- Direct processing of unmodified exported raw data files from the screening device
- Only limited file renaming needed 
- Plate layout provided by the user by an easy to fill medium (excel spreadsheet)
- One click analysis with preloaded default settings
- Output of a software-unbound html interactive report that contains the complete analysis
- Automated installation of needed packages and dependencies
- Automated detection of positive and negative controls
- Automated detection of single/multi wavelength (BRET) experiments
- Possibility to copy and export filtered tables directly from the report as .xls, .csv or .pdf files

## :male_detective: Reproducibility of the analysis and traceability of the raw data

- Embedding of the raw data files and source code inside the report
- Graphical and numeric details of all the processing steps
- Details of the screening device parameters extracted from raw data files
- Details of the analysis parameters
- Possibility of excluding data points from the analysis but still displaying them 

## :gear::chart_with_upwards_trend: Automated data processing and interactive display of the results

- Rolling average of the data (optional)
- Wavelength splitting and ratio (if applicable)
- Aggregation of plate replicates and successive readings
- Data normalization to baseline and vehicle conditions
- Interplate data normalization based on a positive control
- Graphing of the individual well data for each processing step
- Calculation of kinetics metrics for each individual treatment:
  - e.g., peak height, time to peak, area under the fluorescence curve, etc.
  - reference point:
    - baseline at the beginning of the experiment (baseline)
    - time of treatment (t0phase) 
- Interactive display of the resulting dude response curve
- Calculation of dose-response curve metrics when applicable (EC50, AUC of the dose response curve, etc.)
- Interactive display of the dose response curve metrics
- Quality control of the experiment (z-factor)
- Filterable and downloadable tables of all the produced data (individual and aggregated replicates)

# :bar_chart: Results

- Fully self-contained interactive html report allowing easy exploration and sharing of raw and processed data by the user.
- Drastic reduction in result trunover, from 1 week to minutes from the complete processing of a single experiment.

# :arrow_right::arrow_right::arrow_right: Pipeline input, output and parameters

## :inbox_tray: Input

- Raw .txt files renamed with plate name, replicate and reading
- Excel spreadsheet containing the plate description
- Choice of parameters for the analysis (if defaults need to be overwritten)
- <img width="614" height="645" alt="image" src="https://github.com/user-attachments/assets/6a77c625-ccec-4650-b020-4898484e0714" />

## :outbox_tray: Output

- Html report containing for each wavelength and wavelength ratio:
  - Source code of the script (disabled in this repository)
  - Comments from users 
  - Assay volumes (if included by the user)
  - Device acquisition parameters
  - Plate layout before and after name condition cleaning
  - Signal vs time graphing
    - Whole plate
    - <img width="1576" height="1096" alt="image" src="https://github.com/user-attachments/assets/8d6e4542-dd00-42f1-b3f6-779089605f45" />

    - Individual conditions
    - <img width="1579" height="803" alt="image" src="https://github.com/user-attachments/assets/33ff5728-009e-46f8-9631-897b37587069" />

  - Dose-response analysis results:
    - Curves
    - <img width="720" height="410" alt="image" src="https://github.com/user-attachments/assets/a1bd2712-b51d-4acd-9005-9502c8feea11" />
    - Curve metrics
   
    - <img width="1235" height="849" alt="image" src="https://github.com/user-attachments/assets/1662c1c5-8f6f-4d63-8c1e-fa324ffe653c" />

    - Tables
  - Z-factor calculations
  - Quality control tables
  - Data processing and analysis parameters
  - Raw data files (disabled in this repository)
- Prepopulated .pzfx Graphpad Prism files with the dose response curve data
- .csv and binary files for the processed data

## :keyboard: Parametrization of the report

- Parameters of the curve fitting algorithm
- Data normalization procedure (ratio or delta)
- Graphs/tables to output
- Data to export
- drug batch aggregation
- Manual override of positive controls
- 1st peak detection instead of highest peak
- Area under the curve settings
- Manual override for baseline timeframe
- Rolling average parameters
