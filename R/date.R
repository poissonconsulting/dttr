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
