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
#' dtt_date_time(Sys.Date())
dtt_date_time <- function(x, tz, ...) {
  UseMethod("dtt_date_time")
}

#' @export
dtt_date_time.integer <- function(x, tz = dtt_sys_tz(), ...) {
  check_unused(...)
  check_string(tz)
  as.POSIXct(x, tz = tz, origin = '1970-01-01')
}

#' @export
dtt_date_time.numeric <- function(x, tz = dtt_sys_tz(), ...) {
  check_unused(...)
  dtt_date_time(floor(x), tz = tz)
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
