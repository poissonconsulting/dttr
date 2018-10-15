#' Is Date Time
#'
#' @param x An R object. 
#'
#' @return A flag indicating whether R is a POSIXct vector.
#' @export
#'
#' @examples
#' dtt_is_date_time(Sys.Date())
#' dtt_is_date_time(Sys.time())
dtt_is_date_time <- function(x) {
  inherits(x, "POSIXct")
}

#' Is Date
#'
#' @param x An R object. 
#'
#' @return A flag indicating whether R is a Date vector.
#' @export
#'
#' @examples
#' dtt_is_date(Sys.Date())
#' dtt_is_date(Sys.time())
dtt_is_date <- function(x) {
  inherits(x, "Date")
}

#' Is Date or DateTime Object
#'
#' @param x An R object. 
#'
#' @return A flag indicating whether R is a Date or POSIXct vector.
#' @export
#'
#' @examples
#' dtt_is_dtt(Sys.Date())
#' dtt_is_dtt(Sys.time())
dtt_is_dtt <- function(x) {
  dtt_is_date(x) || dtt_is_date_time(x)
}
