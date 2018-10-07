#' Set System Time Zone
#'
#' @param x A string of the time zone to treat as if its the system time zone
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
dtt_set_sys_tz <- function(x = NULL) {
  checkor(check_null(x), check_string(x))
  sys_tz <- options(dtt.sys_tz = x)$dtt.sys_tz
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
  tz <- attr(x,"tzone")
  if(is.null(tz)) return(dtt_sys_tz())
  tz
}
