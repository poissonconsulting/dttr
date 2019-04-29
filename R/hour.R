#' Get and Set Hours
#'
#' @param x A Date or POSIXct vector.
#' @param value A numeric vector of the hour value(s).
#' @param ... Unused.
#' @return An integer vector.
#' @export
#'
#' @examples
#' dtt_hour(Sys.time())
dtt_hour <- function(x, ...) {
  UseMethod("dtt_hour")
}

#' @rdname dtt_hour
#' @export
dtt_hours <- function(x, ...) {
  .Deprecated("dtt_hour")
  UseMethod("dtt_hour")
}

#' @rdname dtt_hour
#' @export
`dtt_hour<-` <- function(x, value) {
  UseMethod("dtt_hour<-")
}

#' @rdname dtt_hour
#' @export
`dtt_hours<-` <- function(x, value) {
  .Deprecated("dtt_hour<-")
  UseMethod("dtt_hour<-")
}

#' @export
dtt_hour.Date <- function(x, ...) {
  check_unused(...)
  rep(0L, length(x))
}

#' @export
dtt_hour.POSIXct <- function(x, ...) {
  check_unused(...)
  x <- as.POSIXlt(x, tz = dtt_tz(x))
  as.integer(x$hour)
}

#' @export
dtt_hour.hms <- function(x, ...) {
  check_unused(...)
  x <- as.POSIXlt(x)
  as.integer(x$hour)
}

#' @export
dtt_hour.dtt_duration <- function(x, ...) {
  check_unused(...)
  as_numeric(x, "hours")
}

#' @export
`dtt_hour<-.POSIXct` <- function(x, value) {
  check_vector(value, c(0L, 23L), length = c(1L, 1L, length(x)))
  if(!length(x)) return(x)
  tz <- dtt_tz(x)
  x <- as.POSIXlt(x, tz = tz)
  x$hour <- value
  as.POSIXct(x, tz = tz)
}

#' @export
`dtt_hour<-.hms` <- function(x, value) {
  check_vector(value, c(0L, 23L), length = c(1L, 1L, length(x)))
  if(!length(x)) return(x)
  .NotYetImplemented()
}
