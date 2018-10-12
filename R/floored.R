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
dtt_floored <- function(x, units) {
  check_string(units)
  identical(dtt_floor(x, units = units), x)
}
