#' Completed
#' 
#' Tests whether a Date or POSIXct object is complete.
#'
#' @param x A Date or POSIXct vector
#' @param sorted A flag indicating whether the values must be sorted.
#' @param unique A flag indicating whether the values must be unique.
#' @param floored A flag indicating whether the values must be floored.
#' @param units A string of the units.
#' @param ... Unused.
#' @return A flag indicating whether complete.
#' @export
#'
#' @examples
#' dtt_completed(date_times)
dtt_completed <- function(x, floored = TRUE, unique = TRUE, sorted = TRUE,  
                          units = dtt_units(x), ...) {
  UseMethod("dtt_completed")
}

#' @export
dtt_completed.Date <- function(x, floored = TRUE, unique = TRUE, sorted = TRUE,  
                               units = dtt_units(x), ...) {
  check_flag(floored)
  check_flag(unique)
  check_flag(sorted)
  check_string(units)
  check_unused(...)

  if(anyNA(x)) return(NA)
  
  if(floored && !dtt_floored(x, units = units)) return(FALSE)
  if(length(x) <= 1) return(TRUE)
  if(unique && anyDuplicated(x)) return(FALSE)
  if(sorted && is.unsorted(x)) return(FALSE)
  x <- dtt_floor(x, units)
  x <- unique(x)
  seq <- try(dtt_seq(min(x), max(x), units = units), silent = TRUE)
  if(inherits(seq, "try-error")) return(FALSE)
  identical(length(x), length(seq)) 
}

#' @export
dtt_completed.POSIXct <- function(x, floored = TRUE, unique = TRUE, sorted = TRUE, 
                                  units = dtt_units(x), ...) {
  check_flag(floored)
  check_flag(unique)
  check_flag(sorted)
  check_string(units)
  check_unused(...)
  
  if(anyNA(x)) return(NA)
  
  if(floored && !dtt_floored(x, units = units)) return(FALSE)
  if(length(x) <= 1) return(TRUE)
  if(unique && anyDuplicated(x)) return(FALSE)
  if(sorted && is.unsorted(x)) return(FALSE)
  x <- dtt_floor(x, units)
  x <- unique(x)
  seq <- try(dtt_seq(min(x), max(x), units = units), silent = TRUE)
  if(inherits(seq, "try-error")) return(FALSE)
  identical(length(x), length(seq)) 
}
