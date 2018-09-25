#' Get Units
#' 
#' The possible units values are 'seconds', 'minutes', 'hours', 'days', 'months' or 'years'.
#'
#' @param x A Date or POSIXct vector.
#' @param units A string of the units to floor by.
#' @param ... Unused.
#' @return The floored Date or POSIXct vector.
#' @export
#'
#' @examples
#' dtt_floor(Sys.time(), "hours")
dtt_floor <- function(x, units, ...) {
  UseMethod("dtt_floor")
}

#' @export
dtt_floor.Date <- function(x, units, ...) {
  check_scalar(units, c("seconds", "minutes", "hours", "days", "months", "years"))
  
  if(!length(x) || units %in% c("seconds", "minutes", "hours", "days")) return(x)
  dtt_days(x) <- 1L
  if(identical(units, "months")) return(x)
  dtt_months(x) <- 1L
  x
}

#' @export
dtt_floor.POSIXct <- function(x, units, ...) {
  check_scalar(units, c("seconds", "minutes", "hours", "days", "months", "years"))
  
  if(!length(x)) return(x)
  if(identical(units, "seconds")) {
    x <- as.POSIXlt(x)
    x$sec <- floor(x$sec)
    x <- as.POSIXct(x)
    return(x)
  }
  dtt_seconds(x) <- 0L
  if(identical(units, "minutes")) return(x)
  dtt_minutes(x) <- 0L
  if(identical(units, "hours")) return(x)
  dtt_hours(x) <- 0L
  if(identical(units, "days")) return(x)
  dtt_days(x) <- 1L
  if(identical(units, "months")) return(x)
  dtt_months(x) <- 1L
  x
}