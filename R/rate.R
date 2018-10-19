#' Create Rate
#'
#' @param x An double vector of the change.
#' @param duration A dtt_duration object of the time interval or 
#' a string of the units.
#'
#' @return A dtt_duration object.
#' @export
#'
#' @examples
#' dtt_rate(60)
dtt_rate <- function(x, duration = dtt_duration(1L)) {
  x <- check_double(x, coerce = TRUE)
  checkor(check_duration(duration), check_time_units(.units))
  
  if(is.character(duration)) duration <- dtt_duration(1L, units = duration)
  
  x <- x / dtt_seconds(duration)
  class(x) <- "dtt_rate"
  x
}

#' @export
format.dtt_rate <- function(x, units = "auto", digits = 6, ...) {
  check_unused(...)
  check_scalar(units, c("auto", .units))
  if(units == "auto") units <- dtt_units(x)

  rate <- as_numeric(x, units = units)
  rate <- signif(rate, digits)
  unit <- sub("s$", "", units)
  paste0(rate, "/", unit)
}

#' @export
print.dtt_rate <- function(x, units = "auto", ...) {
  check_unused(...)
  cat(format(x, units = units), "\n")
}
