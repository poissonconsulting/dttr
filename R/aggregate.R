#' Aggregate 
#'
#' @param x A Date or POSIXct vector.
#' @param units A string of the units to aggregate by.
#'
#' @return The floored, unique Date or POSIXct vector.
#' @export
#'
#' @examples
#' dtt_aggregate(dates)
dtt_aggregate <- function(x, units = dtt_units(x)) {
  check_dtt(x)
  x <- dtt_floor(x, units = units)
  x <- unique(x)
  x
}
