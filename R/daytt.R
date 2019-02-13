#' Dayte Time
#'
#' @param x A Date or POSIXct vector.
#' @param start_month An integer vector specifying the start month of the year.
#' @param start_day An integer vector specifying the start day of the year.
#' @param ... Unused.
#' @return A Date or POSIXct vector with the year for February 29th as 1972.
#' @export
#'
#' @examples
#' dtt_daytt(Sys.Date())
dtt_daytt <- function(x, start_month = 1L, start_day = 1L) {
  check_dtt(x)
  check_vector(start_month, c(1L, 12L), length = c(1L, 1L, length(x)))
  check_vector(start_day, c(1L, 31L), length = c(1L, 1L, length(x)))
  if(!length(x)) return(x)
  dtt_year(x) <- 1972L
  if(all(start_month == 1L & start_day == 1L)) return(x)
  start_date <- p(1972, start_month, start_day, sep = "-")
  start_date <- try(dtt_date(start_date), silent = TRUE)
  if(inherits(start_date, "try-error"))
    err("arguments start_month and start_day must define valid dates")
  start_in_leap <- start_date <= dtt_date("1972-02-29")
  date_in_start <- dtt_date(x) >= start_date
  dtt_year(x[start_in_leap & !date_in_start]) <- 1971L
  dtt_year(x[!start_in_leap & date_in_start]) <- 1973L
  x
}
