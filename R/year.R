#' Get Years
#'
#' @param x A Date or POSIXct vector.
#' @param value A numeric vector of the years value(s).
#' @param ... Unused.
#' @return An integer vector.
#' @export
#'
#' @examples
#' dtt_year(Sys.time())
dtt_year <- function(x, ...) {
  UseMethod("dtt_year")
}

#' @rdname dtt_year
#' @export
dtt_years <- function(x, ...) {
  .Deprecated("dtt_year")
  UseMethod("dtt_year")
}

#' @rdname dtt_year
#' @export
`dtt_year<-` <- function(x, value) {
  UseMethod("dtt_year<-")
}

#' @rdname dtt_year
#' @export
`dtt_years<-` <- function(x, value) {
  .Deprecated("dtt_year<-")
  UseMethod("dtt_year<-")
}

#' @export
dtt_year.Date <- function(x, ...) {
  check_unused(...)
  as.integer(format(x, "%Y"))
}

#' @export
dtt_year.POSIXct <- function(x, ...) {
  check_unused(...)
  x <- as.POSIXlt(x, tz = dtt_tz(x))
  as.integer(x$year + 1900L)
}

#' @export
dtt_year.hms <- function(x, ...) {
  check_unused(...)
  rep(NA_integer_, length(x))
}

#' @export
dtt_year.dtt_duration <- function(x, ...) {
  check_unused(...)
  as_numeric(x, "years")
}

#' @export
`dtt_year<-.Date` <- function(x, value) {
  check_vector(value, c(1L, 2999L), length = c(1L, 1L, length(x)))
  if(!length(x)) return(x)
  x <- format(x)
  if(identical(length(value), 1L)) return(dtt_date(sub_year(x, value)))
  dtt_date(mapply(FUN = sub_year, x, value))
}

#' @export
`dtt_year<-.POSIXct` <- function(x, value) {
  check_vector(value, c(1L, 2999L), length = c(1L, 1L, length(x)))
  if(!length(x)) return(x)
  tz <- dtt_tz(x)
  x <- as.POSIXlt(x, tz = tz)
  x$year <- value - 1900L
  as.POSIXct(x, tz = tz)
}
