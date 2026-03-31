mds_analysis.R
================
bbh
2026-03-31

``` r
dat |>  select(calc_useful:probab_useful) |>
  sapply(collapse_4levels, simplify=FALSE) |> 
sapply(table, simplify=FALSE)
```

    ## $calc_useful
    ## 
    ##    0   1d  1d+ 3wk+ 
    ##    2    9    2    3 
    ## 
    ## $lin_alg_useful
    ## 
    ##    0   1d  1d+ 3wk+ 
    ##    2    6    2    6 
    ## 
    ## $probab_useful
    ## 
    ##    0   1d  1d+ 3wk+ 
    ##    2    6    3    5

“Should general orientation sessions continue to be conducted in the
week before the semester begins, or can they be moved to the first week
of classes where possible?”

``` r
with(dat, table(cohort, orientation_wk1))
```

    ##       orientation_wk1
    ## cohort Should be kept in the week before classes
    ##     y1                                         7
    ##     y2                                         7

“Which of the following team-builiding activities would you recommend
for onboarding?”  
Portion of respondents selecting 1+ options.

``` r
with(dat, mean(!is.na(teambuilding)))
```

    ## [1] 0.875

“Is there something your orientation left out that you think should have
been there?”

``` r
unique(dat$omissions)
```

    ## [1] NA                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         
    ## [2] "Deeper connection with cohort or interaction. Quick get around campus advice. Review of what recommended courses are. Mini-tracks within the program as it is very open ended. Connection to the cohort ahead of us."                                                                                                                                                                                                                                                                                     
    ## [3] "Connecting with the cohort ahead of us. Connecting with the cohort."                                                                                                                                                                                                                                                                                                                                                                                                                                      
    ## [4] "I think an optional central campus tour of the commonly used buildings for the MDS program (West Hall, East Hall, Hatcher, Mason Hall Fishbowl) would have been nice to get a better idea of campus. Also, there should be something that encourages students to share their contact information (eg. instagram, imessage, whatsapp, etc.) with other students in the program. I was with a group that did that organically, and it helped me to stay in touch with other students and make acquaintances"
    ## [5] "If it would have been any trip for us in the starting, it would have been made all of us a team."
