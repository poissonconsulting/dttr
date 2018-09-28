#' Completed
#' 
#' Tests whether a Date or POSIXct object is complete.
#'
#' @param x A Date or POSIXct vector
#' @param units A string of the units.
#' @param ... Unused.
#' @return A flag indicating whether complete.
#' @export
#'
#' @examples
#' dtt_completed(date_times)
dtt_completed <- function(x, units, ...) {
  UseMethod("dtt_completed")
}

#' Complete
#' 
#' Completes a Date or POSIXct vector.
#'
#' @param x A Date or POSIXct vector.
#' @param units A string of the units.
#' @param ... Unused.
#' @return A flag indicating whether complete.
#' @export
#'
#' @examples
#' dtt_completed(date_times)
dtt_complete <- function(x, units, ...) {
  UseMethod("dtt_complete")
}

#' @export
dtt_completed.Date <- function(x, units = dtt_units(x), ...) {
  check_scalar(units, c("days", "months", "years"))
  check_unused(...)

  if(anyNA(x)) return(NA)
  if(length(x) <= 1) return(TRUE)
  
  x <- dtt_floor(x, units)
  x <- unique(x)
  seq <- try(seq(min(x), max(x), by = dtt_units2by(units)), silent = TRUE)
  if(inherits(seq, "try-error")) return(FALSE)
  identical(length(x), length(seq)) 
}

#' @export
dtt_completed.POSIXct <- function(x, units = dtt_units(x), ...) {
  check_scalar(units, c("seconds", "minutes", "hours", "days", "months", "years"))
  check_unused(...)
  
  if(anyNA(x)) return(NA)
  if(length(x) <= 1) return(TRUE)
  
  x <- dtt_floor(x, units)
  x <- unique(x)
  seq <- try(seq(min(x), max(x), by = dtt_units2by(units)), silent = TRUE)
  if(inherits(seq, "try-error")) return(FALSE)
  identical(length(x), length(seq)) 
}

#' @export
dtt_complete.Date <- function(x, units = dtt_units(x), ...) {
  check_scalar(units, c("days", "months", "years"))
  check_unused(...)
  
  if(anyNA(x)) err("Date vectors with missing values cannot be completed")

  if(length(x) <= 1) return(x)
  
  x_floor <- dtt_floor(x, units)
  seq <- seq(min(x_floor), max(x_floor), by = units)
  seq <- setdiff(seq, x_floor)
  x <- c(x, seq)
  x
}

#' @export
dtt_complete.POSIXct <- function(x, units = dtt_units(x), ...) {
  check_scalar(units, c("seconds", "minutes", "hours", "days", "months", "years"))
  check_unused(...)

  if(anyNA(x)) err("POSIXct vectors with missing values cannot be completed")

  if(length(x) <= 1) return(x)
  
  x_floor <- dtt_floor(x, units)
  seq <- try(seq(min(x_floor), max(x_floor), by = dtt_units2by(units)), silent = FALSE)
  if(inherits(seq, "try-error")) err("attempting to generate more than 2^32 POSIXct values")
  seq <- setdiff(seq, x_floor)
  x <- c(x, seq)
  x
}
