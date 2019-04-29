#' Time
#' 
#' Coerce to a hms object.
#' 
#' @param x The object to coerce.
#' @param ... Unused.
#'
#' @return A hms vector.
#' @export
#'
#' @examples
#' dtt_time(Sys.time())
dtt_time <- function(x, ...) {
  UseMethod("dtt_time")
}

#' @export
dtt_time.default <- function(x, ...) {
  check_unused(...)
  as_hms(x)
}

#' @export
dtt_time.numeric <- function(x, ...) {
  check_unused(...)
  x <- floor(x)
  as_hms(x)
}

#' @export
dtt_time.POSIXct <- function(x, ...) {
  check_unused(...)
  hms(seconds = dtt_second(x), minutes = dtt_minute(x), hours = dtt_hour(x))
}
