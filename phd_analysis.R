##+ message=FALSE, echo=FALSE
library(dplyr)
dat  <- readRDS(file="data-processed/phd_responses.rds")

##+
with(dat, table(cohort, orientation_wk1))

##+
dat |> select(phd_lin_alg_useful:mas_math_useful) |>
sapply(table, simplify=FALSE)

##+
unique(dat$omissions)
