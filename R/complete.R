#' Completed
#' 
#' Tests whether a Date or POSIXct object is complete.
#'
#' @param x A Date or POSIXct vector
#' @param sorted A flag indicating whether the values must be sorted.
#' @param unique A flag indicating whether the values must be unique.
#' @param floor A flag indicating whether to floor the values.
#' @param units A string of the units.
#' @param ... Unused.
#' @return A flag indicating whether complete.
#' @export
#'
#' @examples
#' dtt_completed(date_times)
dtt_completed <- function(x, unique = TRUE, sorted = TRUE, floor = TRUE, 
                          units = dtt_units(x), ...) {
  UseMethod("dtt_completed")
}

#' Complete
#' 
#' Completes a Date or POSIXct vector.
#'
#' @param x A Date or POSIXct vector.
#' @param sort A flag indicating whether the returned vector must be sorted.
#' @param unique A flag indicating whether the returned vector must be unique.
#' @param floor A flag indicating whether to floor the values.
#' @param units A string of the units.
#' @param ... Unused.
#' @return The complete and possibly unique and sorted floored vector.
#' @export
#'
#' @examples
#' dtt_completed(date_times)
dtt_complete <- function(x, unique = TRUE, sort = TRUE, floor = TRUE, 
                         units = dtt_units(x), ...) {
  UseMethod("dtt_complete")
}

#' @export
dtt_completed.Date <- function(x, unique = TRUE, sorted = TRUE, floor = TRUE, 
                               units = dtt_units(x), ...) {
  check_flag(unique)
  check_flag(sorted)
  check_flag(floor)
  check_scalar(units, c("days", "months", "years"))
  check_unused(...)

  if(anyNA(x)) return(NA)
  if(length(x) <= 1) return(TRUE)
  
  if(floor) x <- dtt_floor(x, units)
  if(unique && anyDuplicated(x)) return(FALSE)
  if(sorted && is.unsorted(x)) return(FALSE)
  if(!floor) x <- dtt_floor(x, units)
  x <- unique(x)
  seq <- try(seq(min(x), max(x), by = dtt_units2by(units)), silent = TRUE)
  if(inherits(seq, "try-error")) return(FALSE)
  identical(length(x), length(seq)) 
}

#' @export
dtt_completed.POSIXct <- function(x, unique = TRUE, sorted = TRUE, floor = TRUE,
                                  units = dtt_units(x), ...) {
  check_flag(unique)
  check_flag(sorted)
  check_flag(floor)
  check_scalar(units, c("seconds", "minutes", "hours", "days", "months", "years"))
  check_unused(...)
  
  if(anyNA(x)) return(NA)
  if(length(x) <= 1) return(TRUE)
  
  if(floor) x <- dtt_floor(x, units)
  if(unique && anyDuplicated(x)) return(FALSE)
  if(sorted && is.unsorted(x)) return(FALSE)
  if(!floor) x <- dtt_floor(x, units)
  x <- unique(x)
  seq <- try(seq(min(x), max(x), by = dtt_units2by(units)), silent = TRUE)
  if(inherits(seq, "try-error")) return(FALSE)
  identical(length(x), length(seq)) 
}

#' @export
dtt_complete.Date <- function(x, unique = TRUE, sort = TRUE, floor = TRUE, units = dtt_units(x), ...) {
  check_flag(unique)
  check_flag(sort)
  check_flag(floor)
  check_scalar(units, c("days", "months", "years"))
  check_unused(...)
  
  if(anyNA(x)) err("Date vectors with missing values cannot be completed")

  if(length(x) <= 1) return(x)
  
  x_floor <- dtt_floor(x, units)
  seq <- seq(min(x_floor), max(x_floor), by = units)
  seq <- setdiff(seq, x_floor)
  if(floor) x <- x_floor
  if(unique) x <- unique(x)
  x <- c(x, seq)
  if(sort) x <- sort(x)
  x
}

#' @export
dtt_complete.POSIXct <- function(x, unique = TRUE, sort = TRUE, floor = TRUE,
                                 units = dtt_units(x), ...) {
  check_flag(unique)
  check_flag(sort)
  check_flag(floor)
  check_scalar(units, c("seconds", "minutes", "hours", "days", "months", "years"))
  check_unused(...)

  if(anyNA(x)) err("POSIXct vectors with missing values cannot be completed")

  if(length(x) <= 1) return(x)
  
  x_floor <- dtt_floor(x, units)
  seq <- try(seq(min(x_floor), max(x_floor), by = dtt_units2by(units)), silent = FALSE)
  if(inherits(seq, "try-error")) err("attempting to generate more than 2^32 POSIXct values")
  seq <- setdiff(seq, x_floor)
  if(floor) x <- x_floor
  if(unique) x <- unique(x)
  x <- c(x, seq)
  if(sort) x <- sort(x)
  x
}
