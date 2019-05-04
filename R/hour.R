#' Get and Set Hour Values
#' 
#' Gets and sets hour values for date/time vectors.
#'
#' @param x A date/time vector.
#' @param value A integer vector of the hour value(s).
#' @param ... Unused.
#' @return An integer vector (or the modified date/time vector).
#' @export
#'
#' @examples
#' x <- as.POSIXct("1990-01-02 23:40:51")
#' dtt_hour(x)
#' dtt_hour(x) <- 27L
#' x
#' 
#' x <- hms::as_hms("23:40:51")
#' dtt_hour(x)
#' dtt_hour(x) <- 27L
#' x
dtt_hour <- function(x, ...) {
  UseMethod("dtt_hour")
}

#' @rdname dtt_hour
#' @export
`dtt_hour<-` <- function(x, value) {
  UseMethod("dtt_hour<-")
}

#' @describeIn dtt_hour Get integer vector of hour values for a Date vector
#' @export
dtt_hour.Date <- function(x, ...) {
  check_unused(...)
  rep(0L, length(x))
}

#' @describeIn dtt_hour Get integer vector of hour values for a POSIXct vector
#' @export
dtt_hour.POSIXct <- function(x, ...) {
  check_unused(...)
  x <- as.POSIXlt(x, tz = dtt_tz(x))
  as.integer(x$hour)
}

#' @describeIn dtt_hour Get integer vector of hour values for a hms vector
#' @export
dtt_hour.hms <- function(x, ...) {
  check_unused(...)
  x <- dtt_time(x)
  x <- as.POSIXlt(x)
  as.integer(x$hour)
}

#' @describeIn dtt_hour Set hour values for a POSIXct vector
#' @export
`dtt_hour<-.POSIXct` <- function(x, value) {
  check_vector(value, c(0L, 23L), length = c(1L, 1L, length(x)))
  if(!length(x)) return(x)
  tz <- dtt_tz(x)
  x <- as.POSIXlt(x, tz = tz)
  x$hour <- value
  as.POSIXct(x, tz = tz)
}

#' @describeIn dtt_hour Set hour values for a hms vector
#' @export
`dtt_hour<-.hms` <- function(x, value) {
  check_vector(value, c(0L, 23L), length = c(1L, 1L, length(x)))
  if(!length(x)) return(x)
  x <- as.POSIXlt(x)
  x$hour <- value
  dtt_time(x)
}