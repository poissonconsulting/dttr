#' Time
#'
#' @param x A Date vector.
#' @param tz A string of the time zone.
#' @param ... Unused.
#'
#' @return A hms vector.
#' @export
#'
#' @examples
#' dtt_time(Sys.time())
dtt_time <- function(x, tz, ...) {
  UseMethod("dtt_time")
}

#' @export
dtt_time.integer <- function(x, ...) {
  check_unused(...)
  as.hms(x)
}

#' @export
dtt_time.numeric <- function(x, ...) {
  check_unused(...)
  x <- floor(x)
  as.hms(x)
}

#' @export
dtt_time.character <- function(x, ...) {
  check_unused(...)
  as.hms(x)
}

#' @export
dtt_time.POSIXt <- function(x, tz = dtt_tz(x), ...) {
  check_unused(...)
  check_string(tz)
  x <- dtt_adjust_tz(x, tz = tz)
  as.hms(x, tz = tz)
}
