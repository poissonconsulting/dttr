
<!-- README.md is generated from README.Rmd. Please edit that file -->

[![lifecycle](https://img.shields.io/badge/lifecycle-maturing-blue.svg)](https://www.tidyverse.org/lifecycle/#maturing)
[![Travis build
status](https://travis-ci.com/poissonconsulting/dttr.svg?branch=master)](https://travis-ci.com/poissonconsulting/dttr)
[![AppVeyor build
status](https://ci.appveyor.com/api/projects/status/github/poissonconsulting/dttr?branch=master&svg=true)](https://ci.appveyor.com/project/poissonconsulting/dttr)
[![Coverage
status](https://codecov.io/gh/poissonconsulting/dttr/branch/master/graph/badge.svg)](https://codecov.io/github/poissonconsulting/dttr?branch=master)
[![License:
GPL3](https://img.shields.io/badge/License-GPL3-blue.svg)](https://www.gnu.org/licenses/gpl-3.0.en.html)
[![CRAN\_Status\_Badge](http://www.r-pkg.org/badges/version/dttr)](https://cran.r-project.org/package=dttr)

# dttr

`dttr` (DaTe Times in R) is an R package to manipulate date/time
vectors. It provides a light-weight alternative to
[`lubridate`](https://lubridate.tidyverse.org) for simple conversion and
manipulation of Date, POSIXct and hms vectors. It also provides a simple
timer.

Key design principles include:

1.  time units are discrete
2.  timezone handling should be automatic and platform independent

A consequence of the first principle is that date/time objects are
always floored (to remove fractional days or seconds) A consequence of
the second is that the default time zone (which the user can override)
is UTC.

## Introduction

### Time Units

`dttr` floors any objects it encounters to the nearest time unit (days
for Date and seconds for POSIXct and hms).

Similarly, the time unit accessor (`dtt_second()`, `dtt_minute()` etc)
and settor functions as well as the functions to add
(`dtt_add_seconds()`) and subtract time units return or require
integers.

### Time Zones

The user can override the default time zone (UTC) when handling POSIXct
vectors using `dtt_set_sys_tz()`. They can assign a new time zone to a
POSIXct object whilst leaving the clock time unchanged using
`dtt_set_tz()` (equivalent to `lubridate::force_tz()`) or adjust the
time zone so that clock (but not the actual) time is altered using
`dtt_adjust_tz()` (equivalent to `lubridate::with_tz()`)

``` r
library(dttr)
date_time <- dtt_date_time("1970-01-01 03:00:00")
date_time
#> [1] "1970-01-01 03:00:00 UTC"
dtt_set_tz(date_time, tz = "Etc/GMT+8")
#> [1] "1970-01-01 03:00:00 -08"
dtt_adjust_tz(date_time, tz = "Etc/GMT+8")
#> [1] "1969-12-31 19:00:00 -08"
```

## Installation

To install the latest development version from the Poisson drat
[repository](https://github.com/poissonconsulting/drat)

    if(!"drat" %in% installed.packages()[,1]) 
      install.packages("drat")
    drat::addRepo("poissonconsulting")
    install.packages("dttr")

To install the latest development version from
[GitHub](https://github.com/poissonconsulting/checkr)

    if(!"devtools" %in% installed.packages()[,1]) 
      install.packages("devtools")
    devtools::install_github("poissonconsulting/err")
    devtools::install_github("poissonconsulting/checkr")
    devtools::install_github("poissonconsulting/dttr")

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
