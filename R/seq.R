#' Sequence
#' 
#' Creates a unique, ordered complete Date or POSIXct vector.
#'
#' @param from A Date or POSIXct scalar of the start date.
#' @param to A Date or POSIXct scalar of the to date.
#' @param units A string of the units.
#' @return A Date or POSIXct vector.
#' @export
#'
#' @examples
#' dtt_seq(Sys.Date() - 1, Sys.time())
dtt_seq <- function(from, to, units = "days") {
  check_dtt(from, length = 1, nas = FALSE)
  check_dtt(to, length = 1, nas = FALSE)
  check_time_units(units)
  
  if(dtt_is_date(from)) {
    to <- dtt_date(to)
    if(!units %in% c("years", "months", "days"))
      err("units must be ", cc(c("years", "months", "days"), "or"))
    from <- c(from, to)
  } else {
    tz = dtt_tz(from)
    to <- dtt_date_time(to, tz = tz)
    from <- c(from, to)
    from <- dtt_set_tz(from, tz = tz)
  }
  from <- dtt_floor(from, units = units)
  to <- max(from)
  from <- min(from)

  if(dtt_is_date(from)) {
    seq <- seq(from, to, by = dtt_units2by(units))
  } else
    seq <- seq(from, to, by = dtt_units2by(units), tz = dtt_tz(from))
  seq <- dtt_floor(seq, units = units)
  seq
}
