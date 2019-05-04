#' Get Units
#' 
#' Gets the smallest units for a date time vector.
#' The possible values are 'seconds', 'minutes', 'hours', 'days', 'months' or 'years'.
#'
#' @param x A Date, POSIXct or hms vector.
#' @param ... Unused.
#' @return A string indicating the date time units.
#' @export
#'
#' @examples
#' dtt_units(as.Date("2000-01-01"))
#' dtt_units(as.Date("2000-02-01"))
#' dtt_units(as.Date("2000-01-02"))
dtt_units <- function(x, ...) {
  UseMethod("dtt_units")
}

#' @describeIn dtt_units Get time units for a Date vector
#' @export
dtt_units.Date <- function(x, ...) {
  check_unused(...)
  x <- x[!is.na(x)]
  if(!length(x)) return("days")
  
  if(any(dtt_day(x) != 1L)) return("days")
  if(any(dtt_month(x) != 1L)) return("months")
  "years"
}

#' @describeIn dtt_units Get time units for a POSIXct vector
#' @export
dtt_units.POSIXct <- function(x, ...) {
  check_unused(...)
  x <- x[!is.na(x)]
  if(!length(x)) return("seconds")
  
  if(any(dtt_second(x) != 0L)) return("seconds")
  if(any(dtt_minute(x) != 0L)) return("minutes")
  if(any(dtt_hour(x) != 0L)) return("hours")
  if(any(dtt_day(x) != 1L)) return("days")
  if(any(dtt_month(x) != 1L)) return("months")
  "years"
}

#' @describeIn dtt_units Get time units for a hms vector
#' @export
dtt_units.hms <- function(x, ...) {
  check_unused(...)
  x <- x[!is.na(x)]
  if(!length(x)) return("seconds")
  
  if(any(dtt_second(x) != 0L)) return("seconds")
  if(any(dtt_minute(x) != 0L)) return("minutes")
  "hours"
}
