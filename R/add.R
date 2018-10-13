#' Add Years
#'
#' @param x A Date or POSIXct vector.
#' @param n An integer of the number of years to add
#' @param ... Unused.
#'
#' @return The modified Date or POSIXct vector.
#' @export
#'
#' @examples
#' dtt_add_years(Sys.time())
dtt_add_years <- function(x, n = 1L, ...) {
  UseMethod("dtt_add_years")
}

#' Add Months
#'
#' @param x A Date or POSIXct vector.
#' @param n An integer of the number of months to add
#' @param ... Unused.
#'
#' @return The modified Date or POSIXct vector.
#' @export
#'
#' @examples
#' dtt_add_months(Sys.time())
dtt_add_months <- function(x, n = 1L, ...) {
  UseMethod("dtt_add_months")
}

#' Add Days
#'
#' @param x A Date or POSIXct vector.
#' @param n An integer of the number of days to add
#' @param ... Unused.
#'
#' @return The modified Date or POSIXct vector.
#' @export
#'
#' @examples
#' dtt_add_days(Sys.time())
dtt_add_days <- function(x, n = 1L, ...) {
  UseMethod("dtt_add_days")
}

#' Add Hours
#'
#' @param x A POSIXct vector.
#' @param n An integer of the number of hours to add
#' @param ... Unused.
#'
#' @return The modified POSIXct vector.
#' @export
#'
#' @examples
#' dtt_add_hours(Sys.time())
dtt_add_hours <- function(x, n = 1L, ...) {
  UseMethod("dtt_add_hours")
}

#' Add Minutes
#'
#' @param x A POSIXct vector.
#' @param n An integer of the number of minutes to add
#' @param ... Unused.
#'
#' @return The modified POSIXct vector.
#' @export
#'
#' @examples
#' dtt_add_minutes(Sys.time())
dtt_add_minutes <- function(x, n = 1L, ...) {
  UseMethod("dtt_add_minutes")
}

#' Add Seconds
#'
#' @param x A POSIXct vector.
#' @param n An integer of the number of seconds to add
#' @param ... Unused.
#'
#' @return The modified POSIXct vector.
#' @export
#'
#' @examples
#' dtt_add_seconds(Sys.time())
dtt_add_seconds <- function(x, n = 1L, ...) {
  UseMethod("dtt_add_seconds")
}

#' @export
dtt_add_years.default <- function(x, n = 1L, ...) {
  check_dtt(x)
  check_scalar(n, 1L)
  check_unused(...)
  
  dtt_years(x) <- dtt_years(x) + n
  x
}

#' @export
dtt_add_months.default <- function(x, n = 1L, ...) {
  check_dtt(x)
  check_scalar(n, 1L)
  check_unused(...)
  
  months <- dtt_months(x) + n
  years <- months %/% 12L
  months <- months %% 12L
  
  if(months == 0L) {
    months <- 12L
    years <- years - 1L
  }
    
  dtt_months(x) <- months
  dtt_add_years(x, years)
}

#' @export
dtt_add_days.Date <- function(x, n = 1L, ...) {
  check_scalar(n, 1L)
  check_unused(...)
  
  x <- x + n
  x
}

#' @export
dtt_add_days.POSIXct <- function(x, n = 1L, ...) {
  check_scalar(n, 1L)
  check_unused(...)
  
  n <- n * 24L
  dtt_add_hours(x, n)
}

#' @export
dtt_add_hours.POSIXct <- function(x, n = 1L, ...) {
  check_scalar(n, 1L)
  check_unused(...)
  
  n <- n * 60L
  dtt_add_minutes(x, n)
}

#' @export
dtt_add_minutes.POSIXct <- function(x, n = 1L, ...) {
  check_scalar(n, 1L)
  check_unused(...)
  
  n <- n * 60L
  dtt_add_seconds(x, n)
}

#' @export
dtt_add_seconds.POSIXct <- function(x, n = 1L, ...) {
  check_scalar(n, 1L)
  check_unused(...)
  
  x <- x + n
  x
}
