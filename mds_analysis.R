##+ message=FALSE, echo=FALSE
library(dplyr)
dat  <- readRDS(file="data-processed/mds_responses.rds")


##+ echo=-1
collapse_4levels <- function(v) {
  levs0<- c("0", "1d", "3wk", "4wk")
  levs <- c(levs0,
   apply(combn(levs0[-1], 2),2, paste, collapse="+"), 
   apply(combn(levs0[-1], 3),2, paste, collapse="+")) 
  od <- order(levs)
  labs <- c("0", "1d", "3wk+", "3wk+", "1d+", "1d+",  "3wk+", "1d+")
  factor(v, levels=levs[od], labels=labs[od])
}
dat |>  select(calc_useful:probab_useful) |>
  sapply(collapse_4levels, simplify=FALSE) |> 
sapply(table, simplify=FALSE)

#' "Should general orientation sessions continue to be 
#' conducted in the week before the semester begins, or 
#' can they be moved to the first week of classes where possible? "
##+
with(dat, table(cohort, orientation_wk1))

#' "Which of the following team-builiding activities 
#' would you recommend for onboarding?"  
#' Portion of respondents selecting 1+ options. 
#+
with(dat, mean(!is.na(teambuilding)))

#' "Is there something your orientation left out 
#' that you think should have been there?"
##+
unique(dat$omissions)
