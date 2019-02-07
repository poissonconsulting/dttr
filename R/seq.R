#' Sequence
#' 
#' Creates a unique, ordered complete Date or POSIXct vector.
#'
#' @param from A Date or POSIXct scalar of the start date.
#' @param to A Date or POSIXct scalar of the to date.
#' @param units A string of the units.
#' @param length_out An integer of the number of units from from.
#' @return A Date or POSIXct vector.
#' @export
#'
#' @examples
#' dtt_seq(Sys.Date() - 1, Sys.time())
dtt_seq <- function(from = dtt_date("2000-01-01"), 
                    to = dtt_date("2000-01-01"), 
                    units = "days", length_out = NULL) {
  check_dtt(from, length = 1, nas = FALSE)
  check_dtt(to, length = 1, nas = FALSE)
  check_time_units(units)
  checkor(check_null(length_out), check_int(length_out))
  
  if(is.Date(from)) {
    to <- dtt_date(to)
    if(!units %in% c("years", "months", "days"))
      err("units must be ", cc(c("years", "months", "days"), "or"))
    if(!is.null(length_out)) 
      to <- dtt_add_units(from, n = length_out -1L, units = units)
    from <- c(from, to)
  } else {
    tz = dtt_tz(from)
    to <- dtt_date_time(to, tz = tz)
    if(!is.null(length_out)) 
      to <- dtt_add_units(from, n = length_out - 1L, units = units)
    from <- c(from, to)
    from <- dtt_set_tz(from, tz = tz)
  }
  from <- dtt_floor(from, units = units)
  to <- max(from)
  from <- min(from)
  
  if(is.Date(from)) {
    seq <- seq(from, to, by = dtt_units2by(units))
  } else
    seq <- seq(from, to, by = dtt_units2by(units), tz = dtt_tz(from))
  seq <- dtt_floor(seq, units = units)
  seq
}
