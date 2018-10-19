#' As Numeric
#' 
#' @param x An R object.
#' @param ... Unused.
#' @return A numeric vector.
#' @export
as_numeric <- function(x, ...) {
  UseMethod("as_numeric")
}

#' @export
as_numeric.dtt_duration <- function(x, units = "seconds", ...) {
  check_unused(...)
  check_time_units(units)
  x <- unclass(x)
  x <- as.numeric(x)
  if(units == "seconds") return(x)
  x <- x / 60
  if(units == "minutes") return(x)
  x <- x / 60
  if(units == "hours") return(x)
  x <- x / 24
  if(units == "days") return(x)
  x <- x / 30.41667
  if(units == "months") return(x)
  x <- x / 12
  x
}

#' @export
as_numeric.dtt_rate <- function(x, units = "seconds", ...) {
  check_unused(...)
  check_time_units(units)
  x <- unclass(x)
  x <- as.numeric(x)
  if(units == "seconds") return(x)
  x <- x / 60
  if(units == "minutes") return(x)
  x <- x / 60
  if(units == "hours") return(x)
  x <- x / 24
  if(units == "days") return(x)
  x <- x / 30.41667
  if(units == "months") return(x)
  x <- x / 12
  x
}
