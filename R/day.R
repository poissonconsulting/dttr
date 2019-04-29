#' Get and Set Days
#'
#' @param x A Date or POSIXct vector.
#' @param value A numeric vector of the day value(s).
#' @param ... Unused.
#' @return An integer vector.
#' @export
#'
#' @examples
#' dtt_day(Sys.time())
dtt_day <- function(x, ...) {
  UseMethod("dtt_day")
}

#' @rdname dtt_day
#' @export
dtt_days <- function(x, ...) {
  .Deprecated("dtt_day")
  UseMethod("dtt_day")
}

#' @rdname dtt_day
#' @export
`dtt_day<-` <- function(x, value) {
  UseMethod("dtt_day<-")
}

#' @rdname dtt_day
#' @export
`dtt_days<-` <- function(x, value) {
  .Deprecated("dtt_day<-")
  UseMethod("dtt_day<-")
}

#' @export
dtt_day.Date <- function(x, ...) {
  check_unused(...)
  as.integer(format(x, "%d"))
}

#' @export
dtt_day.POSIXct <- function(x, ...) {
  check_unused(...)
  x <- as.POSIXlt(x, tz = dtt_tz(x))
  as.integer(x$mday)
}

#' @export
dtt_day.hms <- function(x, ...) {
  check_unused(...)
  rep(NA_integer_, length(x))
}

#' @export
dtt_day.dtt_duration <- function(x, ...) {
  check_unused(...)
  as_numeric(x, "days")
}

#' @export
`dtt_day<-.Date` <- function(x, value) {
  check_vector(value, c(1L, 31L), length = c(1L, 1L, length(x)))
  if(!length(x)) return(x)
  x <- format(x)
  if(identical(length(value), 1L)) return(dtt_date(sub_day(x, value)))
  dtt_date(mapply(sub_day, x, value))
}

#' @export
`dtt_day<-.POSIXct` <- function(x, value) {
  check_vector(value, c(1L, 31L), length = c(1L, 1L, length(x)))
  if(!length(x)) return(x)
  tz <- dtt_tz(x)
  x <- as.POSIXlt(x, tz = tz)
  x$mday <- value
  as.POSIXct(x, tz = tz)
}
