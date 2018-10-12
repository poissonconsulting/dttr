#' Date Time
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
dtt_date_time <- function(x, tz, ...) {
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
dtt_dayte_time <- function(x, tz, ...) {
  UseMethod("dtt_dayte_time")
}

#' @export
dtt_date_time.character <- function(x, tz = dtt_sys_tz(), ...) {
  check_unused(...)
  check_string(tz)
  as.POSIXct(x, tz = tz)
}

#' @export
dtt_date_time.Date <- function(x, tz = dtt_tz(x), ...) {
  check_unused(...)
  check_string(tz)
  x <- format(x)
  is_na <- is.na(x)
  x[is_na] <- "2000-01-01"
  x <- as.POSIXct(paste(x, "00:00:00"), tz = tz)
  is.na(x[is_na]) <- TRUE
  x
}

#' @export
dtt_date_time.POSIXct <- function(x, tz = dtt_tz(x), ...) {
  check_unused(...)
  check_string(tz)
  x <- dtt_adjust_tz(x, tz = tz)
  dtt_floor(x, units = "seconds")
}

#' @export
dtt_dayte_time.Date <- function(x, tz = dtt_sys_tz(), ...) {
  check_unused(...)
  x <- dtt_date_time(x, tz = tz)
  dtt_dayte_time(x)
}

#' @export
dtt_dayte_time.POSIXct <- function(x, tz = dtt_tz(x), ...) {
  check_unused(...)
  check_string(tz)
  x <- dtt_date_time(x, tz = tz)
  dtt_years(x) <- 1972L
  x
}
