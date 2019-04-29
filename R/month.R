#' Get and Set Months
#'
#' @param x A Date or POSIXct vector.
#' @param value A numeric vector of the month value(s).
#' @param ... Unused.
#' @return An integer vector.
#' @export
#'
#' @examples
#' dtt_month(Sys.time())
dtt_month <- function(x, ...) {
  UseMethod("dtt_month")
}

#' @rdname dtt_month
#' @export
dtt_months <- function(x, ...) {
  .Deprecated("dtt_month")
  UseMethod("dtt_month")
}

#' @rdname dtt_month
#' @export
`dtt_month<-` <- function(x, value) {
  UseMethod("dtt_month<-")
}

#' @rdname dtt_month
#' @export
`dtt_months<-` <- function(x, value) {
  .Deprecated("dtt_month<-")
  UseMethod("dtt_month<-")
}

#' @export
dtt_month.Date <- function(x, ...) {
  check_unused(...)
  as.integer(format(x, "%m"))
}

#' @export
dtt_month.POSIXct <- function(x, ...) {
  check_unused(...)
  x <- as.POSIXlt(x, tz = dtt_tz(x))
  as.integer(x$mon + 1L)
}

#' @export
dtt_month.hms <- function(x, ...) {
  check_unused(...)
  rep(NA_integer_, length(x))
}

#' @export
dtt_month.dtt_duration <- function(x, ...) {
  check_unused(...)
  as_numeric(x, "months")
}

#' @export
`dtt_month<-.Date` <- function(x, value) {
  check_vector(value, c(1L, 12L), length = c(1L, 1L, length(x)))
  if(!length(x)) return(x)
  x <- format(x)
  if(identical(length(value), 1L)) return(dtt_date(sub_month(x, value)))
  dtt_date(mapply(sub_month, x, value))
}

#' @export
`dtt_month<-.POSIXct` <- function(x, value) {
  check_vector(value, c(1L, 12L), length = c(1L, 1L, length(x)))
  if(!length(x)) return(x)
  tz <- dtt_tz(x)
  x <- as.POSIXlt(x, tz = tz)
  x$mon <- value - 1L
  as.POSIXct(x, tz = tz)
}
