#' Floored
#' 
#' The possible units values are 'seconds', 'minutes', 'hours', 'days', 'months' or 'years'.
#'
#' @param x A Date or POSIXct vector.
#' @param units A string of the units to floor by.
#' @param ... Unused.
#' @return A flag indicating whether floored.
#' @export
#'
#' @examples
#' dtt_floored(Sys.time(), "hours")
dtt_floored <- function(x, units = dtt_units(x)) {
  check_dtt(x)
  check_time_units(units)
  y <- dtt_floor(x, units)
  isTRUE(all.equal(y, x))
}
