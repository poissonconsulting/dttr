#' Date
#'
#' @param x A Date or POSIXct vector.
#' @param ... Unused.
#'
#' @return A Date vector.
#' @export
#'
#' @examples
#' dtt_date(Sys.time())
dtt_date <- function(x, ...) {
  UseMethod("dtt_date")
}

#' Dayte
#'
#' @param x A Date or POSIXct vector.
#' @param ... Unused.
#'
#' @return A Date vector.
#' @export
#'
#' @examples
#' dtt_dayte(Sys.Date())
dtt_dayte <- function(x, ...) {
  UseMethod("dtt_dayte")
}

#' Doy
#'
#' @param x A Date or POSIXct vector.
#' @param ... Unused.
#'
#' @return A integer vector between 1 and 366 of the day of the year.
#' @export
#'
#' @examples
#' dtt_doy(Sys.Date())
dtt_doy <- function(x, ...) {
  UseMethod("dtt_doy")
}

#' Dayte Time
#'
#' @param x A Date or POSIXct vector.
#' @param tz A string of the time zone.
#' @param ... Unused.
#'
#' @return A POSIXct vector.
#' @export
#'
#' @examples
#' dtt_dayte_time(Sys.time())
dtt_dayte_time <- function(x, tz, ...) {
  UseMethod("dtt_dayte_time")
}

#' @export
dtt_date.Date <- function(x, ...) {
  check_unused(...)
  x
}

#' @export
dtt_date.POSIXct <- function(x, ...) {
  check_unused(...)
  as.Date(format(x, "%Y-%m-%d"))
}

#' @export
dtt_dayte.Date <- function(x, ...) {
  check_unused(...)
  dtt_years(x) <- 1972L
  x
}

#' @export
dtt_dayte.POSIXct <- function(x, ...) {
  check_unused(...)
  x <- dtt_date(x)
  dtt_years(x) <- 1972L
  x
}

#' @export
dtt_doy.Date <- function(x, ...) {
  check_unused(...)
  as.integer(format(x, "%j"))
}

#' @export
dtt_doy.POSIXct <- function(x, ...) {
  check_unused(...)
  dtt_doy(dtt_date(x))
}

#' @export
dtt_dayte_time.POSIXct <- function(x, ...) {
  check_unused(...)
  dtt_years(x) <- 1972L
  x
}
