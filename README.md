
<!-- README.md is generated from README.Rmd. Please edit that file -->

# dttr

[![lifecycle](https://img.shields.io/badge/lifecycle-experimental-orange.svg)](https://www.tidyverse.org/lifecycle/#experimental)
[![Travis build
status](https://travis-ci.com/poissonconsulting/dttr.svg?branch=master)](https://travis-ci.com/poissonconsulting/dttr)
[![AppVeyor build
status](https://ci.appveyor.com/api/projects/status/github/poissonconsulting/dttr?branch=master&svg=true)](https://ci.appveyor.com/project/poissonconsulting/dttr)
[![Coverage
status](https://codecov.io/gh/poissonconsulting/dttr/branch/master/graph/badge.svg)](https://codecov.io/github/poissonconsulting/dttr?branch=master)
[![License:
MIT](https://img.shields.io/badge/License-MIT-green.svg)](https://opensource.org/licenses/MIT)

`dttr` is a light-weight package to manipulate Date and POSIXct objects.
As well as functions to get, set, add and subtract years, months, days,
hours etc it includes functions to floor objects, set or adjust time
zones and create complete sequences. It also provides duration and timer
objects.

## Installation

To install the latest development version from
[GitHub](https://github.com/poissonconsulting/dttr)

    install.packages("devtools")
    devtools::install_github("poissonconsulting/err")
    devtools::install_github("poissonconsulting/checkr")
    devtools::install_github("poissonconsulting/dttr")

To install the latest development version from the Poisson drat
[repository](https://github.com/poissonconsulting/drat)

    install.packages("drat")
    drat::addRepo("poissonconsulting")
    install.packages("dttr")

## Demonstration

### Get, Set and Seq

The core functions allow the user to easily get and set the components
of Date and POSIXct objects and create a sequence.

``` r
library(dttr)
date_times <- dttr::date_times
date_times
#> [1] "2000-01-01 00:00:00 -08" "1899-12-31 23:59:59 -08"
#> [3] "1972-06-30 23:59:59 -08"
dtt_year(date_times)
#> [1] 2000 1899 1972
dtt_year(date_times) <- c(2000L, 2000L, 2002L)
date_times
#> [1] "2000-01-01 00:00:00 -08" "2000-12-31 23:59:59 -08"
#> [3] "2002-06-30 23:59:59 -08"
dtt_add_years(date_times, 2L)
#> [1] "2002-01-01 00:00:00 -08" "2002-12-31 23:59:59 -08"
#> [3] "2004-06-30 23:59:59 -08"
dtt_floor(date_times, units = "months")
#> [1] "2000-01-01 -08" "2000-12-01 -08" "2002-06-01 -08"
dtt_seq(date_times[1], date_times[2], units = "months")
#>  [1] "2000-01-01 -08" "2000-02-01 -08" "2000-03-01 -08" "2000-04-01 -08"
#>  [5] "2000-05-01 -08" "2000-06-01 -08" "2000-07-01 -08" "2000-08-01 -08"
#>  [9] "2000-09-01 -08" "2000-10-01 -08" "2000-11-01 -08" "2000-12-01 -08"
```

### Time Zones

As well as setting the time zone which does not change the clock time
the user can adjust the time zone which alters the clock time so that
the old and new events are coincident.

``` r
date_times
#> [1] "2000-01-01 00:00:00 -08" "2000-12-31 23:59:59 -08"
#> [3] "2002-06-30 23:59:59 -08"
dtt_set_tz(date_times, tz = "Etc/GMT-1")
#> [1] "2000-01-01 00:00:00 +01" "2000-12-31 23:59:59 +01"
#> [3] "2002-06-30 23:59:59 +01"
dtt_adjust_tz(date_times, tz = "Etc/GMT-1")
#> [1] "2000-01-01 09:00:00 +01" "2001-01-01 08:59:59 +01"
#> [3] "2002-07-01 08:59:59 +01"
```

The user is also able to use `dtt_set_sys_tz()` to define the default
time zone for all package function calls.

### Timer

A object of class `dtt_timer` tracks the clock time in seconds.
`dtt_elapsed()` returns the duration for which the timer has been
running (see below).

``` r
timer <- dtt_timer(start = TRUE)
timer
#> 0s
Sys.sleep(1)
timer
#> 1s
Sys.sleep(1)
timer
#> 2s
timer <- dtt_stop(timer)
timer
#> 2s
Sys.sleep(1)
timer
#> 2s
timer <- dtt_start(timer)
Sys.sleep(1)
timer
#> 3s
as.integer(dtt_elapsed(timer))
#> [1] 3
```

### Duration

An object of class `dtt_duration` is an integer vector that stores the
time in seconds.

``` r
duration <- dtt_elapsed(timer)
duration
#> 3s
class(duration)
#> [1] "dtt_duration"
dtt_minutes(duration)
#> [1] 0.05
```

## Citation

    Warning in citation(package = "dttr"): no date field in DESCRIPTION file of
    package 'dttr'
    Warning in citation(package = "dttr"): could not determine year for 'dttr'
    from package DESCRIPTION file
    
    To cite package 'dttr' in publications use:
    
      Joe Thorley (NA). dttr: Manipulate Date and POSIXct Objects. R
      package version 0.0.0.9016.
      https://github.com/poissonconsulting/dttr
    
    A BibTeX entry for LaTeX users is
    
      @Manual{,
        title = {dttr: Manipulate Date and POSIXct Objects},
        author = {Joe Thorley},
        note = {R package version 0.0.0.9016},
        url = {https://github.com/poissonconsulting/dttr},
      }

## Inspiration

[lubridate](https://lubridate.tidyverse.org)

## Contribution

Please report any
[issues](https://github.com/poissonconsulting/dttr/issues).

[Pull requests](https://github.com/poissonconsulting/dttr/pulls) are
always welcome.

Please note that the ‘dttr’ project is released with a [Contributor Code
of Conduct](CODE_OF_CONDUCT.md). By contributing to this project, you
agree to abide by its terms
