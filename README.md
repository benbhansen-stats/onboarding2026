# Winter 2026 surveys of UM Stats grad students on their onboarding experience


## Repo contents

- *_collate.R create single data files for each of phd, mas, mds from cohort-level tables
- *_analysis.R data analysis
- data-processed/*_questions.csv questions as asked
- data-processed/*_responses.rds respondents' responses

## Usage

### Retrieving the data

Download questionnaire xlsx responses to local computer, using Google Drive's filenames and saving in '~/Downloads`. Scripts `*_collate.R` will take it from there.

### Assemble/update datasets

Download to ~/Downloads/ an xlsx file for each PhD cohort (or each MAS cohort, each MDS cohort).   At the command line then do e.g.

    make data_processed/phd_responses.rds