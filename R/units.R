#' Get Units
#' 
#' The possible values are 'seconds', 'minutes', 'hours', 'days', 'months' or 'years'.
#'
#' @param x A Date or POSIXct vector.
#' @param ... Unused.
#' @return A string indicating the date time units.
#' @export
#'
#' @examples
#' dtt_units(Sys.time())
dtt_units <- function(x, ...) {
  UseMethod("dtt_units")
}

#' Get and Set Seconds
#'
#' @param x A Date or POSIXct vector.
#' @param value A numeric vector of the second value(s).
#' @param ... Unused.
#' @return An integer vector.
#' @export
#'
#' @examples
#' dtt_seconds(Sys.time())
dtt_seconds <- function(x, ...) {
  UseMethod("dtt_seconds")
}

#' @rdname dtt_seconds
#' @export
dtt_second <- function(x, ...) {
  UseMethod("dtt_seconds")
}

#' @rdname dtt_seconds
#' @export
`dtt_seconds<-` <- function(x, value) {
  UseMethod("dtt_seconds<-")
}

#' @rdname dtt_seconds
#' @export
`dtt_second<-` <- function(x, value) {
  UseMethod("dtt_seconds<-")
}

#' Get and Set Minutes
#'
#' @param x A Date or POSIXct vector.
#' @param value A numeric vector of the minute value(s).
#' @param ... Unused.
#' @return An integer vector.
#' @export
#'
#' @examples
#' dtt_minutes(Sys.time())
dtt_minutes <- function(x, ...) {
  UseMethod("dtt_minutes")
}

#' @rdname dtt_minutes
#' @export
dtt_minute <- function(x, ...) {
  UseMethod("dtt_minutes")
}

#' @rdname dtt_minutes
#' @export
`dtt_minutes<-` <- function(x, value) {
  UseMethod("dtt_minutes<-")
}

#' @rdname dtt_minutes
#' @export
`dtt_minute<-` <- function(x, value) {
  UseMethod("dtt_minutes<-")
}

#' Get and Set Hours
#'
#' @param x A Date or POSIXct vector.
#' @param value A numeric vector of the hour value(s).
#' @param ... Unused.
#' @return An integer vector.
#' @export
#'
#' @examples
#' dtt_hours(Sys.time())
dtt_hours <- function(x, ...) {
  UseMethod("dtt_hours")
}

#' @rdname dtt_hours
#' @export
dtt_hour <- function(x, ...) {
  UseMethod("dtt_hours")
}

#' @rdname dtt_hours
#' @export
`dtt_hours<-` <- function(x, value) {
  UseMethod("dtt_hours<-")
}

#' @rdname dtt_hours
#' @export
`dtt_hour<-` <- function(x, value) {
  UseMethod("dtt_hours<-")
}

#' Get and Set Days
#'
#' @param x A Date or POSIXct vector.
#' @param value A numeric vector of the day value(s).
#' @param ... Unused.
#' @return An integer vector.
#' @export
#'
#' @examples
#' dtt_days(Sys.time())
dtt_days <- function(x, ...) {
  UseMethod("dtt_days")
}

#' @rdname dtt_days
#' @export
dtt_day <- function(x, ...) {
  UseMethod("dtt_days")
}

#' @rdname dtt_days
#' @export
`dtt_days<-` <- function(x, value) {
  UseMethod("dtt_days<-")
}

#' @rdname dtt_days
#' @export
`dtt_day<-` <- function(x, value) {
  UseMethod("dtt_days<-")
}

#' Get and Set Months
#'
#' @param x A Date or POSIXct vector.
#' @param value A numeric vector of the month value(s).
#' @param ... Unused.
#' @return An integer vector.
#' @export
#'
#' @examples
#' dtt_months(Sys.time())
dtt_months <- function(x, ...) {
  UseMethod("dtt_months")
}

#' @rdname dtt_months
#' @export
dtt_month <- function(x, ...) {
  UseMethod("dtt_months")
}

#' @rdname dtt_months
#' @export
`dtt_months<-` <- function(x, value) {
  UseMethod("dtt_months<-")
}

#' @rdname dtt_months
#' @export
`dtt_month<-` <- function(x, value) {
  UseMethod("dtt_months<-")
}

#' Get Years
#'
#' @param x A Date or POSIXct vector.
#' @param value A numeric vector of the years value(s).
#' @param ... Unused.
#' @return An integer vector.
#' @export
#'
#' @examples
#' dtt_years(Sys.time())
dtt_years <- function(x, ...) {
  UseMethod("dtt_years")
}

#' @rdname dtt_years
#' @export
dtt_year <- function(x, ...) {
  UseMethod("dtt_years")
}

#' @rdname dtt_years
#' @export
`dtt_years<-` <- function(x, value) {
  UseMethod("dtt_years<-")
}

#' @rdname dtt_years
#' @export
`dtt_year<-` <- function(x, value) {
  UseMethod("dtt_years<-")
}

#' @export
dtt_units.Date <- function(x, ...) {
  if(!length(x) || anyNA(x)) return(NA_character_)

  if(any(dtt_days(x) != 1L)) return("days")
  if(any(dtt_months(x) != 1L)) return("months")
  "years"
}

#' @export
dtt_units.POSIXct <- function(x, ...) {
  if(!length(x) || anyNA(x)) return(NA_character_)

  if(any(dtt_seconds(x) != 0L)) return("seconds")
  if(any(dtt_minutes(x) != 0L)) return("minutes")
  if(any(dtt_hours(x) != 0L)) return("hours")
  if(any(dtt_days(x) != 1L)) return("days")
  if(any(dtt_months(x) != 1L)) return("months")
  "years"
}

#' @export
dtt_seconds.POSIXct <- function(x, ...) {
  x <- as.POSIXlt(x)
  as.integer(x$sec)
}

#' @export
dtt_seconds.Date <- function(x, ...) rep(0L, length(x))

#' @export
dtt_seconds.POSIXct <- function(x, ...) {
  x <- as.POSIXlt(x)
  as.integer(x$sec)
}

#' @export
`dtt_seconds<-.POSIXct` <- function(x, value) {
  check_vector(value, c(0L, 59L), length = c(1L, 1L, length(x)))
  if(!length(x)) return(x)
  x <- as.POSIXlt(x)
  x$sec <- value
  as.POSIXct(x)
}

#' @export
dtt_minutes.Date <- function(x, ...) rep(0L, length(x))

#' @export
dtt_minutes.POSIXct <- function(x, ...) {
  x <- as.POSIXlt(x)
  as.integer(x$min)
}

#' @export
`dtt_minutes<-.POSIXct` <- function(x, value) {
  check_vector(value, c(0L, 59L), length = c(1L, 1L, length(x)))
  if(!length(x)) return(x)
  x <- as.POSIXlt(x)
  x$min <- value
  as.POSIXct(x)
}

#' @export
dtt_hours.Date <- function(x, ...) rep(0L, length(x))

#' @export
dtt_hours.POSIXct <- function(x, ...) {
  x <- as.POSIXlt(x)
  as.integer(x$hour)
}

#' @export
`dtt_hours<-.POSIXct` <- function(x, value) {
  check_vector(value, c(0L, 23L), length = c(1L, 1L, length(x)))
  if(!length(x)) return(x)
  x <- as.POSIXlt(x)
  x$hour <- value
  as.POSIXct(x)
}

#' @export
dtt_days.Date <- function(x, ...) as.integer(format(x, "%d"))

#' @export
dtt_days.POSIXct <- function(x, ...) {
  x <- as.POSIXlt(x)
  as.integer(x$mday)
}

#' @export
`dtt_days<-.Date` <- function(x, value) {
  check_vector(value, c(1L, 31L), length = c(1L, 1L, length(x)))
  if(!length(x)) return(x)
  x <- format(x, "%Y-%m-%d")
  if(identical(length(value), 1L)) return(dtt_date(sub_day(x, value)))
  dtt_date(mapply(sub_day, x, value))
}

#' @export
`dtt_days<-.POSIXct` <- function(x, value) {
  check_vector(value, c(1L, 31L), length = c(1L, 1L, length(x)))
  if(!length(x)) return(x)
  x <- as.POSIXlt(x)
  x$mday <- value
  as.POSIXct(x)
}

#' @export
dtt_months.Date <- function(x, ...) as.integer(format(x, "%m"))

#' @export
dtt_months.POSIXct <- function(x, ...) {
  x <- as.POSIXlt(x)
  as.integer(x$mon + 1L)
}

#' @export
`dtt_months<-.Date` <- function(x, value) {
  check_vector(value, c(1L, 12L), length = c(1L, 1L, length(x)))
  if(!length(x)) return(x)
  x <- format(x, "%Y-%m-%d")
  if(identical(length(value), 1L)) return(dtt_date(sub_month(x, value)))
  dtt_date(mapply(sub_month, x, value))
}

#' @export
`dtt_months<-.POSIXct` <- function(x, value) {
  check_vector(value, c(1L, 12L), length = c(1L, 1L, length(x)))
  if(!length(x)) return(x)
  x <- as.POSIXlt(x)
  x$mon <- value - 1L
  as.POSIXct(x)
}

#' @export
dtt_years.Date <- function(x, ...) as.integer(format(x, "%Y"))

#' @export
dtt_years.POSIXct <- function(x, ...) {
  x <- as.POSIXlt(x)
  as.integer(x$year + 1900L)
}

#' @export
`dtt_years<-.Date` <- function(x, value) {
  check_vector(value, c(1L, 2999L), length = c(1L, 1L, length(x)))
  if(!length(x)) return(x)
  x <- format(x, "%Y-%m-%d")
  if(identical(length(value), 1L)) return(dtt_date(sub_year(x, value)))
  mapply(FUN = sub_year, x, value, USE.NAMES = FALSE)
}

#' @export
`dtt_years<-.POSIXct` <- function(x, value) {
  check_vector(value, c(1L, 2999L), length = c(1L, 1L, length(x)))
  if(!length(x)) return(x)
  x <- as.POSIXlt(x)
  x$year <- value - 1900L
  as.POSIXct(x)
}
