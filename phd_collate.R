##'
library(readxl)
library(dplyr)

##' data locations, short colnames
##+ echo=1L
sheets  <- list()
sheet_locs  <- c(
    y3p='~/Downloads/(Doctoral- third year+) New Graduate Student Onboarding Questionnaire (Responses).xlsx',
    y2='~/Downloads/(Doctoral- second year) New Graduate Student Onboarding Questionnaire (Responses).xlsx',
    y1='~/Downloads/(Doctoral- first year) New Graduate Student Onboarding Questionnaire (Responses).xlsx')

colheads  <- c(
     time= "Timestamp",
 phd_lin_alg_useful="For each of the topics below, consider the utility of a refresher session in a single day during the week before the beginning of classes, and of potential sessions covering similar topics over weekly meetings during the 3 weeks before classes begin.   Check the boxes for the versions you would have found useful, leaving blanks next to topics that wouldn't have been useful to you to review. [Linear algebra PhD background]",
 phd_real_anal_useful="For each of the topics below, consider the utility of a refresher session in a single day during the week before the beginning of classes, and of potential sessions covering similar topics over weekly meetings during the 3 weeks before classes begin.   Check the boxes for the versions you would have found useful, leaving blanks next to topics that wouldn't have been useful to you to review. [Real analysis PhD background]",
 phd_probability_useful="For each of the topics below, consider the utility of a refresher session in a single day during the week before the beginning of classes, and of potential sessions covering similar topics over weekly meetings during the 3 weeks before classes begin.   Check the boxes for the versions you would have found useful, leaving blanks next to topics that wouldn't have been useful to you to review. [Probability PhD background]",
 optimization_useful="For each of the topics below, consider the utility of a refresher session in a single day during the week before the beginning of classes, and of potential sessions covering similar topics over weekly meetings during the 3 weeks before classes begin.   Check the boxes for the versions you would have found useful, leaving blanks next to topics that wouldn't have been useful to you to review. [Optimization essentials for PhD students]",
 computing_useful="For each of the topics below, consider the utility of a refresher session in a single day during the week before the beginning of classes, and of potential sessions covering similar topics over weekly meetings during the 3 weeks before classes begin.   Check the boxes for the versions you would have found useful, leaving blanks next to topics that wouldn't have been useful to you to review. [Scientific computing essentials for PhD students]",
 mas_math_useful="For each of the topics below, consider the utility of a refresher session in a single day during the week before the beginning of classes, and of potential sessions covering similar topics over weekly meetings during the 3 weeks before classes begin.   Check the boxes for the versions you would have found useful, leaving blanks next to topics that wouldn't have been useful to you to review. [Masters in Applied Statistics background in calculus, linear algebra & probability]",
 aug_3wk_times="Assuming a topic struck you as useful, would you have been able to participate in weekly review sessions during the three weeks in August before the start of classes if they occurred at the following weekly times?  Check all that apply:",   
 orientation_wk1="Should general orientation sessions continue to be conducted in the week before the semester begins, or can they be moved to the first week of classes where possible?",         
 teambuilding="Which of the following team-builiding activities would you recommend for onboarding",
 omissions="Is there something your orientation left out that you think should have been there?  If yes, please elaborate.",
classes_1st_sem="Should new students be advised that they can focus on classes during their first semester, waiting until their second terms to seek advisors or summer 1 research supervisors?",          
eli_required="Is your UG degree from a non-English speaking institution, such that the U requires that you take ELI 994 (\"College Teaching in the US\") before working as a GSI?",
eli_taken="did you take ELI 994 during the summer before you started your current graduate program?",         
well_informed="Did you feel well informed on what to expect of the program before the orientation and after?",
would_help="Would you be willing to help with a future cohort's orientation? Check each activity you'd be willing to do:"
)

##'
col_shortnames  <-
    sapply(sheet_locs,
       function(fn) {read_xlsx(fn) |> colnames() |>
           match(unname(colheads))},
       simplify=FALSE) # a position not a name, so...
col_shortnames  <-
    sapply(col_shortnames,
           function(positions) {names(colheads)[positions]},
           simplify = FALSE)               
for (thesheet in names(col_shortnames))
    if (any(is.na(col_shortnames[[thesheet]])))
    {
        stop(paste("Unidentified columns in sheet", thesheet))
    } else {
        sheets[[thesheet]]  <- read_xlsx(sheet_locs[thesheet],
                                         col_names=col_shortnames[[thesheet]],
                                         skip=1L)
##        sheets[[thesheet]]$cohort  <- thesheet
        }
rm(thesheet)

##'
cbind(short=names(colheads), full=colheads) |>
write.csv(file="data-processed/phd_questions.csv",row.names=FALSE)
data_phd  <- do.call(bind_rows, c(sheets, .id='cohort'))

##'
tidyup_values  <- function(cvar) {
    cvar  <- gsub("4 week ", "4wk", cvar, fixed=TRUE)    
    cvar  <- gsub("3 week ", "3wk", cvar, fixed=TRUE)
    cvar  <- gsub("1 day ", "1d", cvar, fixed=TRUE)
    cvar  <- gsub(", ", "+", cvar, fixed=TRUE)
    cvar  <- gsub("review useful", "", cvar, fixed=TRUE)
    cvar  <- gsub("course useful", "", cvar, fixed=TRUE)
    cvar[is.na(cvar)] <- "0"
    cvar
}
data_phd[grep("_useful", colnames(data_phd), fixed=TRUE)] <-
    data_phd[grep("_useful", colnames(data_phd), fixed=TRUE)] |>
sapply(tidyup_values)

##' 

saveRDS(data_phd, file="data-processed/phd_responses.rds")
