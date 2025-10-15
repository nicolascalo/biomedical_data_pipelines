# :paintbrush: Graphical summary

<img width="1917" height="695" alt="image" src="https://github.com/user-attachments/assets/d718397b-227b-42f5-8d20-77b031ad64cc" />

# :exclamation: Situation

The drug discovery platform I belonged to was using flow cytometry to validate the expression of target receptors on the cells destined to be used in the phage display selection process.

However, Cytexpert, the software used to pilot the Cytoflex flow cytometer used for routine work, required manual handling of every single sample for their analysis and had only limited plotting and export functions, making the task tedious and very time-consuming. Furthermore, analysis parameters such as gating boundaries were left to the user appreciation, leading to a lack of analysis standardization within the platform.   

# :ballot_box_with_check: Task

Creating an analysis pipeline for the processing of individual flow cytometry experiments answering the following requirements:
- Open source and free-to-use software ecosystem
- Ease of use for users with limited skills in computers use, but option to tune the parameters of the analysis
- Reproducibility of the analysis and traceability of the raw data
- Automated data processing and interactive display of the results
  
# :point_right: Action

## :computer: Open source and free-to-use software ecosystem

- R and RStudio (for parametrized R-markdown reporting)
- Plotly for interactive graphs
- ggplot2 for static graphs
- DT for interactive tables

## :girl::boy: Ease of use for people uncomfortable with computers

- Direct processing of unmodified raw data files from the flow cytometer
- No file renaming needed 
- Plate layout provided by the user by an easy to fill medium (excel spreadsheet)
- One click analysis with preloaded default settings
- Output of a software-unbound html interactive report that contains the complete analysis
- Automated installation of needed packages and dependencies
- Possibility to copy and export filtered tables directly from the report as .xls, .csv or .pdf files
- Possibility to analyze multiple plates at once and outputing a single html report

## :male_detective: Reproducibility of the analysis and traceability of the raw data

- Embedding of plate templates and source code inside the report
- Graphical and numeric details of all the processing steps
- Details of the analysis parameters included in the html report
- Possibility of excluding data points from the analysis but still displaying them 

## :gear::chart_with_upwards_trend: Automated data processing and interactive display of the results

- Individually for each sample
  - Outlier cleaning base on chosen percentiles to retain
  - Debris cleaning (optional)
  - Identification of and gating on the cell cluster of interest based on user-defined SSC/FSC areas
  - Singlet gating on SSC and FSC values
  - Removal from the dataset of samples below a minimal number of events 
- After aggregation of all samples
  - Graphing of cell populations based on user-defined parameters
  - Static and interactive plots of statistics (*e.g,*, median fluorescence intensity, etc.) for the chosen fluorescence channels
  - Filterable and downloadable tables for event counts at each steps of the analysis, individual sample statistics, and replicate sample statistics 

# :bar_chart: Results

- Fully self-contained interactive html report allowing easy exploration and sharing of raw and processed data by the user.
- Drastic reduction in result trunover and improvements in reporting completeness

# :arrow_right::arrow_right::arrow_right: Pipeline input, output and parameters

## :inbox_tray: Input

- Raw .fcs files organized within folders (one for each plate)
- Excel spreadsheet containing the plate description for each plate
- Choice of parameters for the analysis (if defaults need to be overwritten)
  - <img width="779" height="356" alt="image" src="https://github.com/user-attachments/assets/4bb7db46-3328-46bb-8173-b3339eb5730a" />

## :outbox_tray: Output

- Html report containing :
  - Plate layouts
  - For each analyzed plate, SSC / FSC representation of:
    - Raw data
      - <img width="1072" height="129" alt="image" src="https://github.com/user-attachments/assets/755c242d-3562-40ef-b900-252086cfed21" />
    - Outlier cleaning
      - <img width="1072" height="129" alt="image" src="https://github.com/user-attachments/assets/0b1fc186-4e97-4cd1-8940-2cb5b0fea68d" />
    - Main cell population gating
      - <img width="1068" height="127" alt="image" src="https://github.com/user-attachments/assets/9b1e3bce-f9d0-44d1-b088-ea1087fe2e03" />
      - <img width="1068" height="135" alt="image" src="https://github.com/user-attachments/assets/c2b65507-0d84-48e8-988f-75267ea75be0" />
    - Singlets cleaning, SSC
      - <img width="1072" height="135" alt="image" src="https://github.com/user-attachments/assets/8af0ecff-0bda-4e62-90b0-6bf7eeca5ce6" />
    - Singlets cleaning, FSC
      - <img width="1073" height="135" alt="image" src="https://github.com/user-attachments/assets/70b6b240-7e00-4f9c-be7b-da643126015e" />
    - Cleaned dataset
      - <img width="1069" height="135" alt="image" src="https://github.com/user-attachments/assets/f4a90953-ff83-40e4-8448-b65bef6e4948" />
  - After sample aggregation
    - Sample population plots and comparison
      - <img width="2569" height="707" alt="image" src="https://github.com/user-attachments/assets/c088fd40-3702-436e-9efd-4d935f54c9e2" />
    - Static plt for sample population statistics
      - <img width="2611" height="1246" alt="image" src="https://github.com/user-attachments/assets/bd894563-acf2-4f37-88ee-8a1cde5d5687" />
    - Interactive plot for sample population statistics
      - <img width="2582" height="967" alt="image" src="https://github.com/user-attachments/assets/a054187d-f252-460b-afe2-f183da78bc91" />
    - Interactive tables for sample population statistics
      - <img width="2559" height="623" alt="image" src="https://github.com/user-attachments/assets/7c22b5ef-f2d8-48b0-b2d3-4d8b59c7e826" />
      - <img width="1798" height="532" alt="image" src="https://github.com/user-attachments/assets/4de2998f-a413-48a9-8e1a-766e3e1a1d86" />
  - Parameters of the analysis
    - <img width="1787" height="341" alt="image" src="https://github.com/user-attachments/assets/a0698506-bdf3-4714-aed3-2da7319bec26" />
- .csv files for the processed data

## :keyboard: Parametrization of the report

- data cleaning steps to perform 
- Gating parameters
- Plot layouts and themes
- Plot scales
- Sample comparisons to make (*e.g.*, comparison between cell backgrouds)
