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
dtt_date.Date <- function(x, ...) x

#' @export
dtt_date.POSIXct <- function(x, ...) {
  as.Date(format(x, "%Y-%m-%d"))
}

#' @export
dtt_dayte.Date <- function(x, ...) {
  dtt_years(x) <- 1972L
  x
}

#' @export
dtt_dayte.POSIXct <- function(x, ...) {
  x <- dtt_date(x)
  dtt_years(x) <- 1972L
  x
}

#' @export
dtt_dayte_time.POSIXct <- function(x, ...) {
  dtt_years(x) <- 1972L
  x
}
