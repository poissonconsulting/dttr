#' Sequence
#' 
#' Creates a date/time sequence vector.
#' from and to are first floored and then a sequence is created by units.
#' If length_out is defined then that number of units are added to from.
#'
#' @param from A date/time scalar of the start.
#' @param to A date/time scalar of the end.
#' @param units A string of the time units.
#' @param length_out An integer of the number of units from from.
#' @return The date/time vector.
#' @export
#'
#' @examples
#' dtt_seq(Sys.Date() - 1, Sys.time())
dtt_seq <- function(from, to, units, ...) {
  UseMethod("dtt_seq")
}

#' @describeIn dtt_seq Create a Date sequence vector
#' @export
dtt_seq.Date <- function(from, to = from, units = "days", length_out = NULL) {
  check_scalar(from, Sys.Date(), named = NA)
  check_scalar(units, .units_Date)
  checkor(check_null(length_out), check_pos_int(length_out))
  
  from <- dtt_floor(from, units = units)
  
  if(!is.null(length_out)) 
    to <- dtt_add_units(from, n = length_out -1L, units = units)
  
  check_scalar(to, Sys.Date(), named = NA)
  
  to <- dtt_floor(to, units = units)
  
  if(from == to) return(from)
  
  ascending <- from < to
  if(!ascending) {
    to2 <- to
    to <- from
    from <- to2
  }
  
  seq <- seq(from, to, by = units2by(units))
  seq <- dtt_aggregate(seq, units = units)
  if(!ascending) seq <- rev(seq)
  seq
}

#' @describeIn dtt_seq Create a POSIXct sequence vector
#' @export
dtt_seq.POSIXct <- function(from, to = from, units = "seconds", length_out = NULL) {
  check_scalar(from, Sys.time(), named = NA)
  check_time_units(units)
  checkor(check_null(length_out), check_pos_int(length_out))
  
  from <- dtt_floor(from, units = units)
  
  tz <- dtt_tz(from)
  if(!is.null(length_out)) 
    to <- dtt_add_units(from, n = length_out - 1L, units = units)
  
  check_scalar(to, Sys.time(), named = NA)
  check_tz(to, tz = tz)

  to <- dtt_floor(to, units = units)
  
  if(from == to) return(from)
  
  ascending <- from < to
  if(!ascending) {
    to2 <- to
    to <- from
    from <- to2
  }
  
  seq <- seq(from, to, by = units2by(units), tz = tz)
  seq <- dtt_aggregate(seq, units = units)
  if(!ascending) seq <- rev(seq)
  seq
}
