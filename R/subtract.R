#' Subtract Years
#'
#' @param x A Date or POSIXct vector.
#' @param n An integer of the number of years to subtract
#' @param ... Unused.
#'
#' @return The modified Date or POSIXct vector.
#' @export
#'
#' @examples
#' dtt_subtract_years(Sys.time())
dtt_subtract_years <- function(x, n = 1L) {
  check_scalar(n, 1L)
  dtt_add_years(x, n * -1L)
}

#' @describeIn dtt_subtract_years Subtract Months
#' @export
dtt_subtract_months <- function(x, n = 1L) {
  check_scalar(n, 1L)
  dtt_add_months(x, n * -1L)
}

#' @describeIn dtt_subtract_years Subtract Days
#' @export
dtt_subtract_days <- function(x, n = 1L) {
  check_scalar(n, 1L)
  dtt_add_days(x, n * -1L)
}

#' @describeIn dtt_subtract_years Subtract Hours
#' @export
dtt_subtract_hours <- function(x, n = 1L) {
  check_scalar(n, 1L)
  dtt_add_hours(x, n * -1L)
}

#' @describeIn dtt_subtract_years Subtract Minutes
#' @export
dtt_subtract_minutes <- function(x, n = 1L) {
  check_scalar(n, 1L)
  dtt_add_minutes(x, n * -1L)
}

#' @describeIn dtt_subtract_years Subtract Seconds
#' @export
dtt_subtract_seconds <- function(x, n = 1L) {
  check_scalar(n, 1L)
  dtt_add_seconds(x, n * -1L)
}

#' @describeIn dtt_add_units Subtract Units
#' @export
dtt_subtract_units <- function(x, n = 1L, units = dtt_units(x)) {
  check_dtt(x)
  n <- n * -1L
  dtt_add_units(x, n = n, units = units)
}
