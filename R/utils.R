#' Units per Unit
#'
#' @param units A string of the time units.
#' @param unit A string of the time unit.
#'
#' @return A number of the units per unit
#' @export
#'
#' @examples
#' dtt_units_per_unit("hours")
dtt_units_per_unit <- function(units = "seconds", unit = "days") {
  check_time_units(units)
  check_time_units(units)
  as_numeric(dtt_duration(1, unit)) / as_numeric(dtt_duration(1, units))
}

#' Adjust Units
#'
#' @param x An integer or numeric vector
#' @param from A string of the original units.
#' @param to A string of the new units.
#'
#' @return A numeric vector.
#' @export
#'
#' @examples
#' dtt_adjust_units(60, to = "minutes")
dtt_adjust_units <- function(x, from = "seconds", to = "seconds") {
  checkor(check_vector(x, 1), check_vector(x, 1L))
  x * dtt_units_per_unit(to, from)
}

#' @export
c.POSIXct <- function(..., recursive = FALSE) {
  dots <- list(...)
  .POSIXct(c(unlist(lapply(dots, unclass))), tz = dtt_tz(dots[[1]]))
}
