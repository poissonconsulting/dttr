#' Complete
#' 
#' Completes a Date or POSIXct vector.
#'
#' @param x A Date or POSIXct vector.
#' @param floor A flag indicating whether to floor the values.
#' @param unique A flag indicating whether to return distinct values.
#' @param sort A flag indicating whether the returned vector must be sorted.
#' @param units A string of the units.
#' @param ... Unused.
#' @return The complete and possibly unique and sorted floored vector.
#' @export
#'
#' @examples
#' dtt_completed(date_times)
dtt_complete <- function(x, floor = TRUE, unique = TRUE, sort = TRUE, 
                         units = dtt_units(x), ...) {
  UseMethod("dtt_complete")
}

#' @export
dtt_complete.Date <- function(x, floor = TRUE, unique = TRUE, sort = TRUE, 
                              units = dtt_units(x), ...) {
  check_flag(floor)
  check_flag(unique)
  check_flag(sort)
  check_string(units)
  check_unused(...)
  
  if(anyNA(x)) err("Date vectors with missing values cannot be completed")

  x_floor <- dtt_floor(x, units)
  if(floor) x <- x_floor

  if(length(x) <= 1) return(x)
  
  seq <- seq(min(x_floor), max(x_floor), by = units)
  seq <- setdiff(seq, x_floor)
  if(unique) x <- unique(x)
  x <- c(x, seq)
  if(sort) x <- sort(x)
  x
}

#' @export
dtt_complete.POSIXct <- function(x, floor = TRUE, unique = TRUE, sort = TRUE, 
                                 units = dtt_units(x), ...) {
  check_flag(floor)
  check_flag(unique)
  check_flag(sort)
  check_string(units)
  check_unused(...)

  if(anyNA(x)) err("POSIXct vectors with missing values cannot be completed")
  
  x_floor <- dtt_floor(x, units)
  if(floor) x <- x_floor

  if(length(x) <= 1) return(x)
  
  seq <- try(seq(min(x_floor), max(x_floor), by = dtt_units2by(units)), silent = FALSE)
  if(inherits(seq, "try-error")) err("attempting to generate more than 2^32 POSIXct values")
  seq <- setdiff(seq, x_floor)
  if(unique) x <- unique(x)
  x <- c(x, seq)
  if(sort) x <- sort(x)
  x
}
