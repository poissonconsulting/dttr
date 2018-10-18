#' Set System Time Zone
#'
#' @param tz A string of the time zone to treat as if its the system time zone
#' when call \code{\link{dtt_sys_tz}} or \code{NULL} to reset.
#'
#' @return A string of the old value.
#' @export
#'
#' @examples
#' \dontrun{
#' dtt_sys_tz()
#' old <- dtt_set_sys_tz("Etc/GMT+8")
#' dtt_sys_tz()
#' dtt_reset_sys_tz()
#' dtt_sys_tz()
#' dtt_set_sys_tz(old)
#' dtt_sys_tz()
#' }
dtt_set_sys_tz <- function(tz = NULL) {
  checkor(check_null(tz), check_string(tz))
  sys_tz <- options(dtt.sys_tz = tz)$dtt.sys_tz
  if(is.null(sys_tz)) sys <- Sys.timezone()
  invisible(sys_tz)
}

#' @describeIn dtt_set_sys_tz Reset System Time Zone
#' @export
dtt_reset_sys_tz <- function() {
  dtt_set_sys_tz()
}

#' Get System Time Zone
#' 
#' The user also has the option to set the value returned by \code{dtt_sys_tz()}
#' using \code{\link{dtt_set_sys_tz}}.
#'
#' @return A string of the time zone.
#' @export
#'
#' @examples
#' dtt_sys_tz()
dtt_sys_tz <- function() {
  getOption("dtt.sys_tz", Sys.timezone())
}

#' Time Zone
#'
#' @param x A POSIXct vector.
#' @param ... Unused.
#'
#' @return A string of the time zone.
#' @export
#'
#' @examples
#' dtt_tz(Sys.time())
dtt_tz <- function(x, ...) {
  UseMethod("dtt_tz")
}

#' @export
dtt_tz.Date <- function(x, ...) {
  check_unused(...)
  dtt_sys_tz()
}

#' @export
dtt_tz.POSIXct <- function(x, ...) {
  check_unused(...)
  tz <- attr(x, "tzone")
  if(is.null(tz) || identical(tz, "")) return(dtt_sys_tz())
  tz
}

#' Set Time Zone
#' 
#' Sets the time zone without adjusting the time.
#'
#' @param x A POSIXct vector.
#' @param tz A string of the new time zone.
#' @param ... Unused.
#'
#' @return The POSIXct vector with the new time zone.
#' @export
#'
#' @examples
#' dtt_set_tz(Sys.time(), tz = "UTC")
dtt_set_tz <- function(x, tz = dtt_sys_tz(), ...) {
  UseMethod("dtt_set_tz")
}

#' @export
dtt_set_tz.POSIXct <- function(x, tz = dtt_sys_tz(), ...) {
  check_string(tz)
  dtt_date_time(format(x, tz = dtt_tz(x)), tz = tz)
}

#' Adjust Time Zone
#' 
#' Adjust the time zone and time.
#'
#' @param x A POSIXct vector.
#' @param tz A string of the new time zone.
#' @param ... Unused.
#'
#' @return The POSIXct vector with the new time zone and time.
#' @export
#'
#' @examples
#' dtt_adjust_tz(Sys.time(), tz = "UTC")
dtt_adjust_tz <- function(x, tz = dtt_sys_tz(), ...) {
  UseMethod("dtt_adjust_tz")
}

#' @export
dtt_adjust_tz.POSIXct <- function(x, tz = dtt_sys_tz(), ...) {
  check_string(tz)
  attr(x, "tzone") <- tz
  x
}
