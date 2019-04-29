#' Get Units
#' 
#' The possible values are 'seconds', 'minutes', 'hours', 'days', 'months' or 'years'.
#'
#' @param x A Date or POSIXct vector.
#' @param ... Unused.
#' @return A string indicating the date time units.
#' @export
#'
#' @examples
#' dtt_units(Sys.time())
dtt_units <- function(x, ...) {
  UseMethod("dtt_units")
}

#' @export
dtt_units.Date <- function(x, ...) {
  check_unused(...)
  x <- x[!is.na(x)]
  if(!length(x)) return("days")
  
  if(any(dtt_day(x) != 1L)) return("days")
  if(any(dtt_month(x) != 1L)) return("months")
  "years"
}

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

#' @export
dtt_units.dtt_duration <- function(x, ...) {
  check_unused(...)
  x <- unclass(x)
  if(all(is.na(x))) return("seconds")
  if(mean(x, na.rm = TRUE) < 60) return("seconds")
  x <- x / 60
  if(mean(x, na.rm = TRUE) < 60) return("minutes")
  x <- x / 60
  if(mean(x, na.rm = TRUE) < 24) return("hours")
  x <- x / 24
  if(mean(x, na.rm = TRUE) < 30.41667) return("days")
  x < x / 30.41667
  if(mean(x, na.rm = TRUE) < 12) return("months")
  "years"
}
