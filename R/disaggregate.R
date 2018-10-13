#' Disaggregate 
#'
#' Breaks a floored, unique, ordered, complete Date or POSIXct vector
#' into its subunits.
#'  
#' @param x A Date or POSIXct vector.
#' @param ... Unused.
#'
#' @return The disaggregated Date or POSIXct vector.
#' @export
#'
#' @examples
#' dtt_disaggregate(as.Date("2002-01-01"))
dtt_disaggregate <- function(x, ...) {
  UseMethod("dtt_disaggregate")
}

#' @export
dtt_disaggregate.Date <- function(x, ...) {
  check_dtt(x, unique = TRUE, sorted = TRUE, complete = TRUE)
  check_unused(...)
  
  units <- dtt_units(x)
  if(identical(units, "days"))
    err("Date vectors cannot be disaggregated below 'days'")
  end <- x[length(x)]
  
  if(identical(units, "months")) {
    end <- dtt_add_months(end)
    end <- dtt_subtract_days(end)
  } else {
    end <- dtt_add_years(end)
    end <- dtt_subtract_months(end)
  }
  x <- c(x, end)
  x <- dtt_complete(x)
  x
}

#' @export
dtt_disaggregate.POSIXct <- function(x, ...) {
  check_dtt(x, unique = TRUE, sorted = TRUE, complete = TRUE)
  check_unused(...)
  
  units <- dtt_units(x)
  if(identical(units, "seconds"))
    err("POSIXct vectors cannot be disaggregated below 'seconds'")
  end <- x[length(x)]
  
  if(identical(units, "minutes")) {
    end <- dtt_add_minutes(end)
    end <- dtt_subtract_seconds(end)
  } else if(identical(units, "hours")) {
    end <- dtt_add_hours(end)
    end <- dtt_subtract_minutes(end)
  } else if(identical(units, "days")) {
    end <- dtt_add_days(end)
    end <- dtt_subtract_hours(end)
  } else if(identical(units, "months")) {
    end <- dtt_add_months(end)
    end <- dtt_subtract_days(end)
  } else {
    end <- dtt_add_years(end)
    end <- dtt_subtract_months(end)
  }
  x <- c(x, end)
  x <- dtt_complete(x)
  x
}

