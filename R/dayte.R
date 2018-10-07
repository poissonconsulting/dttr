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

#' Date
#'
#' @param x A Date vector.
#' @param tz A string of the time zone.
#' @param ... Unused.
#'
#' @return A DateTime vector.
#' @export
#'
#' @examples
#' dtt_dayte_time(Sys.Date())
dtt_date_time <- function(x, tz = dtt_sys_tz(), ...) {
  UseMethod("dtt_date_time")
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
#' dtt_dayte_time(Sys.Date())
#' dtt_dayte_time(Sys.time())
dtt_dayte_time <- function(x, tz = dtt_sys_tz(), ...) {
  UseMethod("dtt_dayte_time")
}

#' @export
dtt_date.character <- function(x, ...) {
  check_unused(...)
  as.Date(x)
}

#' @export
dtt_date.Date <- function(x, ...) {
  check_unused(...)
  dtt_floor(x, units = "days")
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
  dtt_dayte(dtt_date(x))
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
dtt_date_time.character <- function(x, tz = dtt_sys_tz(), ...) {
  check_unused(...)
  check_string(tz)
  as.POSIXct(x, tz = tz)
}

#' @export
dtt_date_time.Date <- function(x, tz = dtt_sys_tz(), ...) {
  check_unused(...)
  check_string(tz)
  as.POSIXct(paste(format(x, "%Y-%m-%d"), "00:00:00"), tz = tz)
}

#' @export
dtt_date_time.POSIXct <- function(x, tz = dtt_sys_tz(), ...) {
  check_unused(...)
  check_string(tz)
  if(dtt_tz(x) != tz) err("time zone conversion not yet implemented")
  dtt_floor(x, units = "seconds")
}

#' @export
dtt_dayte_time.Date <- function(x, tz = dtt_sys_tz(), ...) {
  check_unused(...)
  x <- dtt_date_time(x, tz = tz)
  dtt_dayte_time(x)
}

#' @export
dtt_dayte_time.POSIXct <- function(x, tz = dtt_sys_tz(), ...) {
  check_unused(...)
  check_string(tz)
  if(dtt_tz(x) != tz) err("time zone conversion not yet implemented")
  dtt_years(x) <- 1972L
  dtt_floor(x, units = "seconds")
  x
}
