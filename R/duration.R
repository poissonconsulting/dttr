#' Create Duration
#'
#' @param x An numeric vector of the duration.
#' @param units A string of the time units.
#'
#' @return A dtt_duration object.
#' @export
#'
#' @examples
#' dtt_duration(60)
dtt_duration <- function(x, units = "seconds") {
  x <- check_double(x, coerce = TRUE)
  check_time_units(units)
  
  if(units == "seconds") return(duration(x))
  x <- x * 60
  if(units == "minutes") return(duration(x))
  x <- x * 60
  if(units == "hours") return(duration(x))
  x <- x * 24
  if(units == "days") return(duration(x))
  x <- x * 30.41667
  if(units == "months") return(duration(x))
  x <- x * 12
  duration(x)
}

#' @export
format.dtt_duration <- function(x, units = "auto", digits = 2, ...) {
  check_unused(...)
  check_scalar(units, c("auto", .units_POSIXct))
  if(units == "auto") units <- dtt_units(x)

  secs <- unclass(x)
  if(units == "seconds")
    return(paste0(secs, "s"))
  x <- as_numeric(x, units = units)
  x <- signif(x, digits)
  paste0(secs, "s (~", x, " ", units, ")")
}

#' @export
print.dtt_duration <- function(x, units = "auto", ...) {
  check_unused(...)
  cat(format(x, units = units), "\n")
}
