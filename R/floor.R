#' Floor
#' 
#' Floors a date/time vector
#' 
#' The possible units values are 'seconds', 'minutes', 'hours', 'days', 'months' or 'years'.
#'
#' @param x A date/time vector.
#' @param units A string of the units to floor by.
#' @param ... Unused.
#' @return The floored date/time vector.
#' @export
#'
#' @examples
#' dtt_floor(Sys.time(), "hours")
dtt_floor <- function(x, units, ...) {
  UseMethod("dtt_floor")
}

#' @export
dtt_floor.Date <- function(x, units = "days", ...) {
  check_scalar(units, c("days", "months", "years"))
  check_unused(...)
  
  if(!length(x)) return(x)

  if(units == "days") {
    x <- unclass(x)
    x <- floor(x)
    class(x) <- "Date"
    return(x)
  }
  dtt_day(x) <- 1L
  if(identical(units, "months")) return(x)
  dtt_month(x) <- 1L
  x
}

#' @export
dtt_floor.POSIXct <- function(x, units = "seconds", ...) {
  check_time_units(units)
  check_unused(...)
  
  if(!length(x)) return(x)
  
  if(identical(units, "seconds")) {
    tz <- dtt_tz(x)
    x <- as.POSIXlt(x, tz = tz)
    x$sec <- floor(x$sec)
    x <- as.POSIXct(x, tz = tz)
    return(x)
  }
  dtt_second(x) <- 0L
  if(identical(units, "minutes")) return(x)
  dtt_minute(x) <- 0L
  if(identical(units, "hours")) return(x)
  dtt_hour(x) <- 0L
  if(identical(units, "days")) return(x)
  dtt_day(x) <- 1L
  if(identical(units, "months")) return(x)
  dtt_month(x) <- 1L
  x
}

#' @export
dtt_floor.hms <- function(x, units = "seconds", ...) {
  check_scalar(units, c("seconds", "minutes", "hours"))
  check_unused(...)
  
  if(!length(x)) return(x)
  
  if(identical(units, "seconds")) {
    x <- unclass(x)
    x <- floor(x)
    return(as_hms(x))
  }
  dtt_second(x) <- 0L
  if(identical(units, "minutes")) return(x)
  dtt_minute(x) <- 0L
  x
}
