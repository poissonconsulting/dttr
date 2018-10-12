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
#' @param floored A flag indicating whether x should be floored.
#' @param complete A flag indicating whether x should be complete.
#' @param units A string of the units.
#' @return An invisible copy of x (if it doesn't throw an error).
#' @seealso \code{\link[checkr]{check_vector}}
#' @export
#'
#' @examples
#' check_dtt(1, error = FALSE)
#' check_dtt(Sys.Date())
#' check_dtt(Sys.time())
check_dtt <- function(x, length = NA, unique = FALSE,
                           sorted = FALSE, floored = FALSE, 
                           complete = FALSE,
                           units = dtt_units(x), named = NA, 
                           x_name = substitute(x),
                           error = TRUE) {
  x_name <- chk_deparse(x_name)
  
  checkor(
    check_vector(x, c(Sys.Date(), NA), length = length, unique = unique, 
                 sorted = sorted, named = named, x_name = x_name, error = error),
    check_vector(x, c(Sys.time(), NA), length = length, unique = unique, 
                 sorted = sorted, named = named, x_name = x_name, error = error)
  )
  if(floored) check_floored(x, units = units, x_name = x_name, error = error)
  if(complete) check_complete(x, floored = floored, unique = unique, 
                              sorted = sorted, units = units, x_name = x_name,
                              error = error)
  invisible(x)
}
