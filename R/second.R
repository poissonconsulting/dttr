#' Get and Set Seconds
#'
#' @param x A Date or POSIXct vector.
#' @param value A numeric vector of the second value(s).
#' @param ... Unused.
#' @return An integer vector.
#' @export
#'
#' @examples
#' dtt_second(Sys.time())
dtt_second <- function(x, ...) {
  UseMethod("dtt_second")
}

#' @rdname dtt_second
#' @export
dtt_seconds <- function(x, ...) {
  .Deprecated("dtt_second")
  UseMethod("dtt_second")
}

#' @rdname dtt_second
#' @export
`dtt_second<-` <- function(x, value) {
  UseMethod("dtt_second<-")
}

#' @rdname dtt_second
#' @export
`dtt_seconds<-` <- function(x, value) {
  .Deprecated("dtt_second<-")
  UseMethod("dtt_second<-")
}

#' @export
dtt_second.Date <- function(x, ...) {
  check_unused(...)
  rep(0L, length(x))
}

#' @export
dtt_second.POSIXct <- function(x, ...) {
  check_unused(...)
  x <- as.POSIXlt(x, tz = dtt_tz(x))
  as.integer(x$sec)
}

#' @export
dtt_second.hms <- function(x, ...) {
  check_unused(...)
  x <- as.POSIXlt(x)
  as.integer(x$sec)
}

#' @export
dtt_second.dtt_duration <- function(x, ...) {
  check_unused(...)
  as.integer(x)
}

#' @export
`dtt_second<-.POSIXct` <- function(x, value) {
  check_vector(value, c(0L, 59L), length = c(1L, 1L, length(x)))
  if(!length(x)) return(x)
  tz <- dtt_tz(x)
  x <- as.POSIXlt(x, tz = tz)
  x$sec <- value
  as.POSIXct(x, tz = tz)
}

#' @export
`dtt_second<-.hms` <- function(x, value) {
  check_vector(value, c(0L, 59L), length = c(1L, 1L, length(x)))
  if(!length(x)) return(x)
  .NotYetImplemented()
}
