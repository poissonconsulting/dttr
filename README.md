
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

`dttr` (Dates, Times and a TimeR) is an R package to manipulate date
(Date), date time (POSIXct) and time (hms) vectors. It provides a
light-weight alternative to
[`lubridate`](https://lubridate.tidyverse.org) for simple conversions
and manipulations. It also provides a simple timer.

A key design principle is that

> dates are dates and times are times.

A consequence of this principle is that dates, date times and times are
always floored to remove fractional days or seconds. A second
consequence is that negative times (hms) or times greater than 23:59:59
are always wrapped to give the actual time. If the user wishes to
perform arthimetic on date time vectors then they should do so before
passing the vectors to `dttr`.

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

## Introduction

### Time Units

`dttr` floors any objects it encounters to the nearest time unit (days
for Date and seconds for POSIXct and hms).

``` r
library(dttr)
date <- as.Date(1.75, origin = "1970-01-01")
date
#> [1] "1970-01-02"
as.numeric(date)
#> [1] 1.75

date <- dtt_date(date)
date
#> [1] "1970-01-02"
as.numeric(date)
#> [1] 1
```

Similarly, the time unit accessor (`dtt_second()`, `dtt_minute()` etc)
and settor functions as well as the functions to add (ie
`dtt_add_seconds()`) and subtract time units return or require integers.

``` r
dtt_day(date)
#> [1] 2
dtt_add_days(date, 2L)
#> [1] "1970-01-04"
dtt_add_months(date, 24L)
#> [1] "1972-01-02"
```

### Times

`dttr` wraps negative times or times greater than 23:59:59 to the actual
clock time.

``` r
time <- hms::as_hms(-3)
time
#> -00:00:03
dtt_time(time)
#> 23:59:57
dtt_time(hms::as_hms("24:00:00"))
#> 00:00:00
```

### Time Zones

The user can override the default time zone (UTC) when handling POSIXct
vectors using `dtt_set_default_tz()`.

``` r
dtt_default_tz()
#> [1] "UTC"
date_time <- dtt_date_time("1970-01-01 03:00:00")
dtt_set_default_tz("Etc/GMT+10")
dtt_default_tz()
#> [1] "Etc/GMT+10"
date_time
#> [1] "1970-01-01 03:00:00 UTC"
```

They can assign a new time zone to a POSIXct object whilst leaving the
clock time unchanged using `dtt_set_tz()` (equivalent to
`lubridate::force_tz()`) or adjust the time zone so that clock (but not
the actual) time is altered using `dtt_adjust_tz()` (equivalent to
`lubridate::with_tz()`)

``` r
date_time
#> [1] "1970-01-01 03:00:00 UTC"
dtt_set_tz(date_time)
#> [1] "1970-01-01 03:00:00 -10"
dtt_adjust_tz(date_time)
#> [1] "1969-12-31 17:00:00 -10"
```

### Combining Dates and Times

`dttr` makes it easy to decompose POSIXct vectors into Date and hms
vectors and then recombine them again.

As neither dates nor times have associated time zones unless the user
passes a value they are assigned the default time zone.

``` r
date_time
#> [1] "1970-01-01 03:00:00 UTC"
date <- dtt_date(date_time)
date
#> [1] "1970-01-01"
time <- dtt_time(date_time)
time
#> 03:00:00
dtt_date_time(date, time)
#> [1] "1970-01-01 03:00:00 -10"
```

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
