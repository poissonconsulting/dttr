#' Is Date Time
#'
#' @param x An R object. 
#'
#' @return A flag indicating whether R is a POSIXct vector.
#' @export
dtt_is_date_time <- function(x) {
  .Deprecated("is.POSIXct")
  is.POSIXct(x)
}
#' Is Date
#'
#' @param x An R object. 
#'
#' @return A flag indicating whether R is a Date vector.
#' @export
dtt_is_date <- function(x) {
  .Deprecated("is.Date")
  is.Date(x)
}

#' Is Date or DateTime Object
#'
#' @param x An R object. 
#'
#' @return A flag indicating whether R is a Date or POSIXct vector.
#' @export
dtt_is_dtt <- function(x) {
  .Deprecated("is.Date_or_POSIXct")
  is.Date_or_POSIXct(x)
}

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

#' Is POSIXct
#' 
#' Tests whether an R object is a POSIXct
#' @param x The R object to test.
#' @return A flag indicating whether x inherits from POSIXct
#' @export
is.POSIXct <- function(x) inherits(x, "POSIXct")

#' Is POSIXct
#' 
#' Tests whether an R object is a Date.
#' @param x The R object to test.
#' @return A flag indicating whether x inherits from Date.
#' @export
is.Date <- function(x) inherits(x, "Date")

#' Is Date or POSIXct
#' 
#' Tests whether an R object is a Date or POSIXct.
#' @param x The R object to test.
#' @return A flag indicating whether x inherits from Date or POSIXct.
#' @export
is.Date_or_POSIXct <- function(x) is.Date(x) || is.POSIXct(x)

#' Missing POSIXct
#' 
#' A missing POSIXct object
#' @export
NA_POSIXct_ <- .POSIXct(NA_real_, tz = "UTC")

#' Missing Date
#' 
#' A missing Date object
#' @export
NA_Date_ <- .Date(NA_real_)
