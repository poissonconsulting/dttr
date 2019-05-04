#' Dayte
#'
#' @param x A date time vector.
#' @param start_month An integer vector specifying the start month of the year.
#' @param start_day An integer vector specifying the start day of the year.
#' @return A Date vector with the year set to year.
#' @param ... Unused.
#' @return A Date vector of the daytes.
#' @export
#'
#' @examples
#' dtt_dayte(as.Date("2001-01-01", "2015-12-13"))
dtt_dayte <- function(x, ...) {
  UseMethod("dtt_dayte")
}

#' @describeIn dtt_dayte Dayte a Date vector
#' @export
dtt_dayte.Date <- function(x, start_month = 1L, start_day = 1L, ...) {
  check_vector(start_month, c(1L, 12L), length = c(1L, 1L, length(x)))
  check_vector(start_day, c(1L, 31L), length = c(1L, 1L, length(x)))
  check_unused(...)
  
  if(!length(x)) return(x)
  
  dtt_year(x) <- 1972L
  if(all(start_month == 1L & start_day == 1L)) return(x)
  
  start_date <- paste(1972, start_month, start_day, sep = "-")
  start_date <- try(dtt_date(start_date), silent = TRUE)
  if(inherits(start_date, "try-error"))
    err("start_month and start_day must define valid dates")
  start_in_leap <- start_date <= as.Date("1972-02-29")
  date_in_start <- dtt_date(x) >= start_date
  dtt_year(x[start_in_leap & !date_in_start]) <- 1971L
  dtt_year(x[!start_in_leap & date_in_start]) <- 1973L
  x
}

#' @describeIn dtt_dayte Dayte a POSIXct vector
#' @export
dtt_dayte.POSIXct <- function(x, start_month = 1L, start_day = 1L, ...) {
  check_unused(...)
  dtt_dayte(dtt_date(x), start_month = start_month, start_day = start_day)
}
