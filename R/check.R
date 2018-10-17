#' Check Duration
#' 
#' Checks an object is a \code{dtt_duration}.
#' 
#' @inheritParams checkr::check_integer
#' @return An invisible copy of x (if it doesn't throw an error).
#' @seealso \code{\link{dtt_duration}}
#' @export
#'
#' @examples
#' check_duration(dtt_duration(1L))
check_duration <- function(x, x_name = substitute(x)) {
  x_name <- chk_deparse(x_name)
  check_inherits(x, "dtt_duration", x_name = x_name)
  check_integer(x, coerce = TRUE)
  invisible(x)
}

#' Check Time Zone
#' 
#' Checks an object's time zone as returned by \code{dtt_tz()}.
#' 
#' @inheritParams checkr::check_sorted
#' @param tz A string of the time zone to check that x's matches.
#' @inheritParams dtt_tz
#' @return An invisible copy of x (if it doesn't throw an error).
#' @seealso \code{\link{dtt_tz}}
#' @export
#'
#' @examples
#' check_tz(Sys.time(), "UTC", error = FALSE)
check_tz <- function(x, tz = dtt_tz(x),
                     x_name = substitute(x),
                     error = TRUE) {
  x_name <- chk_deparse(x_name)
  check_string(tz)
  check_flag(error)
  
  if (!identical(tz, dtt_tz(x))) {
    chk_fail(x_name, "'s time zone must be '", tz, "' not ('", dtt_tz(x),"')", 
             error = error)
  }
  invisible(x)
}

#' Check Floored
#' 
#' Checks whether an object x is floored using \code{dtt_floored()}.
#' 
#' @inheritParams checkr::check_sorted
#' @inheritParams dtt_floored
#' @return An invisible copy of x (if it doesn't throw an error).
#' @seealso \code{\link{dtt_floored}}
#' @export
#'
#' @examples
#' check_floored(Sys.time(), "days", error = FALSE)
check_floored <- function(x, units,
                          x_name = substitute(x),
                          error = TRUE) {
  x_name <- chk_deparse(x_name)
  check_string(units)
  check_flag(error)
  
  if (!dtt_floored(x, units = units))
    chk_fail(x_name, " must be floored", error = error)
  invisible(x)
}

#' Check Complete
#' 
#' Checks whether an object x is complete using \code{dtt_completed()}.
#' 
#' @inheritParams checkr::check_sorted
#' @inheritParams dtt_completed
#' @return An invisible copy of x (if it doesn't throw an error).
#' @seealso \code{\link{dtt_completed}}
#' @export
#'
#' @examples
#' check_complete(Sys.Date())
check_complete <- function(x, floored = TRUE, unique = TRUE, sorted = TRUE, 
                           units = dtt_units(x),
                           x_name = substitute(x),
                           error = TRUE) {
  x_name <- chk_deparse(x_name)
  check_string(units)
  check_flag(error)
  
  if (!dtt_completed(x, floored = floored, unique = unique, sorted = sorted, 
                     units = units))
    chk_fail(x_name, " must be complete", error = error)
  invisible(x)
}

#' Check DateTime Vector
#' 
#' Checks whether object x is a Date or POSIXct vector.
#' 
#' @inheritParams checkr::check_vector
#' @param nas A flag indicating whether missing values are permitted.
#' @param floored A flag indicating whether x should be floored.
#' @param complete A flag indicating whether x should be complete.
#' @param tz A string of the time zone.
#' @param units A string of the units.
#' @return An invisible copy of x (if it doesn't throw an error).
#' @seealso \code{\link[checkr]{check_vector}}
#' @export
#'
#' @examples
#' check_dtt(Sys.Date())
#' check_dtt(Sys.time())
check_dtt <- function(x, values = NULL, nas = TRUE, 
                      length = NA, unique = FALSE,
                      sorted = FALSE, floored = FALSE, 
                      complete = FALSE, tz = dtt_tz(x),
                      units = dtt_units(x), named = NA, 
                      x_name = substitute(x),
                      error = TRUE) {
  x_name <- chk_deparse(x_name)
  check_flag(nas)
  
  indices <- if(nas) 1:2 else 1L
  if(is.null(values)) {
    checkor(
      check_vector(x, c(Sys.Date(), NA)[indices], length = length, unique = unique, 
                   sorted = sorted, named = named, x_name = x_name, error = TRUE),
      check_vector(x, c(Sys.time(), NA)[indices], length = length, unique = unique, 
                   sorted = sorted, named = named, x_name = x_name, error = TRUE)
    )
  } else {
    checkor(check_vector(values, c(Sys.Date, NA)[indices]), 
            check_vector(values, c(Sys.time(), NA)[indices]))
    check_tz(values, tz)
    check_vector(x, values, length = length, unique = unique, 
                 sorted = sorted, named = named, x_name = x_name, error = error)  
  }
  if(floored) check_floored(x, units = units, x_name = x_name, error = error)
  if(complete) check_complete(x, floored = floored, unique = unique, 
                              sorted = sorted, units = units, x_name = x_name,
                              error = error)
  check_tz(x, tz = tz, x_name = x_name, error = error)
  invisible(x)
}
