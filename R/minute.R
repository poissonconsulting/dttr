#' Get and Set Minutes
#'
#' @param x A Date or POSIXct vector.
#' @param value A numeric vector of the minute value(s).
#' @param ... Unused.
#' @return An integer vector.
#' @export
#'
#' @examples
#' dtt_minute(Sys.time())
dtt_minute <- function(x, ...) {
  UseMethod("dtt_minute")
}

#' @rdname dtt_minute
#' @export
dtt_minutes <- function(x, ...) {
  .Deprecated("dtt_minute")
  UseMethod("dtt_minute")
}

#' @rdname dtt_minute
#' @export
`dtt_minute<-` <- function(x, value) {
  UseMethod("dtt_minute<-")
}

#' @rdname dtt_minute
#' @export
`dtt_minutes<-` <- function(x, value) {
  .Deprecated("dtt_minute<-")
  UseMethod("dtt_minute<-")
}

#' @export
dtt_minute.Date <- function(x, ...) {
  check_unused(...)
  rep(0L, length(x))
}

#' @export
dtt_minute.POSIXct <- function(x, ...) {
  check_unused(...)
  x <- as.POSIXlt(x, tz = dtt_tz(x))
  as.integer(x$min)
}

#' @export
dtt_minute.hms <- function(x, ...) {
  check_unused(...)
  x <- as.POSIXlt(x)
  as.integer(x$min)
}

#' @export
dtt_minute.dtt_duration <- function(x, ...) {
  check_unused(...)
  as_numeric(x, "minutes")
}

#' @export
`dtt_minute<-.POSIXct` <- function(x, value) {
  check_vector(value, c(0L, 59L), length = c(1L, 1L, length(x)))
  if(!length(x)) return(x)
  tz <- dtt_tz(x)
  x <- as.POSIXlt(x, tz = tz)
  x$min <- value
  as.POSIXct(x, tz = tz)
}

#' @export
`dtt_minute<-.hms` <- function(x, value) {
  check_vector(value, c(0L, 59L), length = c(1L, 1L, length(x)))
  if(!length(x)) return(x)
  .NotYetImplemented()
}

