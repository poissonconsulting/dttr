#' Dayte
#'
#' @param x A Date or POSIXct vector.
#' @param start_month An integer vector specifying the start month of the year.
#' @param start_day An integer vector specifying the start day of the year.
#' @return A Date vector with the year set to 1972.
#' @export
#'
#' @examples
#' dtt_dayte(Sys.Date())
dtt_dayte <- function(x, start_month = 1L, start_day = 1L) 
  dtt_daytt(dtt_date(x), start_month = start_month, start_day = start_day)
