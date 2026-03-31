# Standard Makefile boilerplate
SHELL = /bin/sh

RSCRIPT = /opt/local/bin/Rscript
RDO = $(RSCRIPT) -e 

data-processed/mds_responses.rds : mds_collate.R\
	data-raw/(MDS\ 1st\ Year)\ New\ Graduate\ Student\ Onboarding\ Questionnaire\ (Responses).xlsx\
	data-raw/(MDS\ 2nd\ Year)\ New\ Graduate\ Student\ Onboarding\ Questionnaire\ (Responses).xlsx
	$(RSCRIPT) mds_collate.R

data-processed/phd_responses.rds : phd_collate.R\
	data-raw/(Doctoral-\ third\ year+)\ New\ Graduate\ Student\ Onboarding\ Questionnaire\ (Responses).xlsx\
	data-raw/(Doctoral-\ second\ year)\ New\ Graduate\ Student\ Onboarding\ Questionnaire\ (Responses).xlsx\
	data-raw/(Doctoral-\ first\ year)\ New\ Graduate\ Student\ Onboarding\ Questionnaire\ (Responses).xlsx
	$(RSCRIPT) phd_collate.R

mds_analysis.md : mds_analysis.R\
	data-processed/mds_responses.rds
	$(RDO) 'rmarkdown::render("mds_analysis.R", "github_document")'

phd_analysis.md : phd_analysis.R\
	data-processed/phd_responses.rds
	$(RDO) 'rmarkdown::render("phd_analysis.R", "github_document")'
