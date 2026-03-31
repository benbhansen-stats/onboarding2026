phd_analysis.R
================
bbh
2026-03-31

``` r
dat |>  select(real_anal_useful:mas_math_useful) |>
  sapply(collapse_4levels, simplify=FALSE) |> 
sapply(table, simplify=FALSE)
```

    ## $real_anal_useful
    ## 
    ##    0   1d  1d+ 3wk+ 
    ##    6    6    1    9 
    ## 
    ## $probab_useful
    ## 
    ##    0   1d  1d+ 3wk+ 
    ##    7   11    0    4 
    ## 
    ## $optimization_useful
    ## 
    ##    0   1d  1d+ 3wk+ 
    ##    4   10    1    7 
    ## 
    ## $computing_useful
    ## 
    ##    0   1d  1d+ 3wk+ 
    ##    4   10    0    8 
    ## 
    ## $mas_math_useful
    ## 
    ##    0   1d  1d+ 3wk+ 
    ##    8   11    0    3

“Should general orientation sessions continue to be conducted in the
week before the semester begins, or can they be moved to the first week
of classes where possible?”

``` r
with(dat, table(cohort, orientation_wk1))
```

    ##       orientation_wk1
    ## cohort Both the week before and week 1 are OK
    ##    y1                                       2
    ##    y2                                       2
    ##    y3p                                      4
    ##       orientation_wk1
    ## cohort Should be kept in the week before classes
    ##    y1                                          5
    ##    y2                                          3
    ##    y3p                                         6

“Which of the following team-builiding activities would you recommend
for onboarding?”  
Portion of respondents selecting 1+ options.

``` r
with(dat, mean(!is.na(teambuilding)))
```

    ## [1] 0.955

“Is there something your orientation left out that you think should have
been there?”

``` r
unique(dat$omissions)
```

    ## [1] NA                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         
    ## [2] "I don't know if this is the right place to put this, but I thought orientation itself was pretty extensive, but it was stressful to have to wait until orientation for a lot of the info. For example, I remember a bunch of us being super confused about GSI assignments and what was expected of us before we got to campus. This also caused issues with deciding courses because we didn't know what our workload would be like. I think it would have been nice to hear more from the department in the weeks leading up to orientation, even if that was things like \"expect your GSI assignment the week before classes start\"."
    ## [3] "More interaction with faculty and current students would be helpful to better get familiar with the environment"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          
    ## [4] "In general, there was no reason to get to know anybody, so I only ended up getting to know the people that were easiest to talk to (more social, more similar in identity, etc). So it would be nice to have some forced interactions with others so that we had a reason to get to know each other."
