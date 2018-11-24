#' Study Year
#'
#' @inheritParams dtt_dayte
#' @return A character vector of the study year.
#' @export
#'
#' @examples
#' dtt_study_year(Sys.Date())
#' dtt_study_year(as.Date(c("2000-03-31", "2000-04-01", "2001-04-01")), start_month = 4L)
dtt_study_year <- function(x, start_month = 1L, start_day = 1L) {
  check_dtt(x)
  check_vector(start_month, c(1L, 12L), length = c(1L, 1L, length(x)))
  check_vector(start_day, c(1L, 31L), length = c(1L, 1L, length(x)))
  if(!length(x)) return(character(0))
  year <- dtt_year(x)
  if(all(start_month == 1L & start_day == 1L)) 
    return(paste(year, year, sep = "-"))
  start_date <- paste(year, start_month, start_day, sep = "-")
  start_date <- try(dtt_date(start_date), silent = TRUE)
  if(inherits(start_date, "try-error"))
    err("arguments start_month and start_day must define valid dates for each year")
  date_in_start <- dtt_date(x) >= start_date
  year[!date_in_start] <- year[!date_in_start] - 1L
  paste(year, year + 1L, sep = "-")
}