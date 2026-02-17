# Standard Makefile boilerplate
SHELL = /bin/sh

RSCRIPT = /opt/local/bin/Rscript
RDO = $(RSCRIPT) -e 

data-processed/phd_responses.rds : phd_collate.R\
	~/Downloads/(Doctoral-\ third\ year+)\ New\ Graduate\ Student\ Onboarding\ Questionnaire\ (Responses).xlsx\
	~/Downloads/(Doctoral-\ second\ year)\ New\ Graduate\ Student\ Onboarding\ Questionnaire\ (Responses).xlsx\
	~/Downloads/(Doctoral-\ first\ year)\ New\ Graduate\ Student\ Onboarding\ Questionnaire\ (Responses).xlsx
	$(RSCRIPT) phd_collate.R

phd_analysis.md : phd_analysis.R\
	data-processed/phd_responses.rds
	$(RDO) 'rmarkdown::render("phd_analysis.R", "github_document")'
