#' Complete
#' 
#' Completes date/time vector.
#'
#' @param x A date/time vector.
#' @param from A date/time scalar of the start.
#' @param to A date/time vector of the end.
#' @param floor A flag indicating whether to floor the values.
#' @param unique A flag indicating whether to return distinct values.
#' @param sort A flag indicating whether the returned vector must be sorted.
#' @param units A string of the time units.
#' @param ... Unused.
#' @return The complete and possibly unique and sorted floored vector.
#' @export
#'
#' @examples
#' dtt_completed(date_times)
dtt_complete <- function(x, from = min(x), to = max(x), floor = TRUE, unique = TRUE, sort = TRUE, 
                         units = dtt_units(x), ...) {
  UseMethod("dtt_complete")
}

#' @export
dtt_complete.Date <- function(x, from = min(x), to = max(x), floor = TRUE, unique = TRUE, sort = TRUE, 
                              units = dtt_units(x), ...) {
  check_vector(x, Sys.Date(), length = TRUE)
  check_dtt(from, nas = FALSE, length = 1)
  check_dtt(to, nas = FALSE, length = 1)
  check_flag(floor)
  check_flag(unique)
  check_flag(sort)
  check_time_units(units)
  check_unused(...)
  
  from <- dtt_date(from)
  to <- dtt_date(to)
  
  x_floor <- dtt_floor(x, units)
  from <- dtt_floor(from, units = units)
  to <- dtt_floor(to, units = units)
  
  if(from > to) err("from must not be greater than to")
  if(from > min(x_floor) || to < max(x_floor)) err("from and to must span x")
  
  if(floor) x <- x_floor
  seq <- dtt_seq(from, to, units = units)
  
  seq <- setdiff(seq, x_floor)
  if(unique) x <- unique(x)
  x <- c(x, seq)
  if(sort) x <- sort(x)
  x
}

#' @export
dtt_complete.POSIXct <- function(x, from = min(x), to = max(x), 
                                 floor = TRUE, unique = TRUE, sort = TRUE, 
                                 units = dtt_units(x), ...) {
  
  check_vector(x, Sys.time(), length = TRUE)
  check_dtt(from, nas = FALSE, length = 1)
  check_dtt(to, nas = FALSE, length = 1)
  
  check_flag(floor)
  check_flag(unique)
  check_flag(sort)
  check_string(units)
  check_unused(...)
  
  from <- dtt_date_time(from, tz = dtt_tz(x))
  to <- dtt_date_time(to, tz = dtt_tz(x))

  x_floor <- dtt_floor(x, units)
  from <- dtt_floor(from, units = units)
  to <- dtt_floor(to, units = units)
  
  if(from > to) err("from must not be greater than to")
  if(from > min(x_floor) || to < max(x_floor)) err("from and to must span x")
  
  if(floor) x <- x_floor
  seq <- try(dtt_seq(from, to, units = units), silent = FALSE)
  if(inherits(seq, "try-error")) err("attempting to generate more than 2^32 POSIXct values")
  seq <- setdiff(seq, x_floor)
  if(unique) x <- unique(x)
  x <- c(x, seq)
  if(sort) x <- sort(x)
  x
}
