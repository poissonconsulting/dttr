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
#' dtt_second(Sys.time())
dtt_second <- function(x, ...) {
  UseMethod("dtt_second")
}

#' @rdname dtt_second
#' @export
dtt_seconds <- function(x, ...) {
  .Deprecated("dtt_second")
  UseMethod("dtt_second")
}

#' @rdname dtt_second
#' @export
`dtt_seconds<-` <- function(x, value) {
  .Deprecated("dtt_second<-")
  UseMethod("dtt_second<-")
}

#' @rdname dtt_second
#' @export
`dtt_second<-` <- function(x, value) {
  UseMethod("dtt_second<-")
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
#' dtt_minute(Sys.time())
dtt_minute <- function(x, ...) {
  UseMethod("dtt_minute")
}

#' @rdname dtt_minute
#' @export
dtt_minutes <- function(x, ...) {
  .Deprecated("dtt_minute")
  UseMethod("dtt_minute")
}

#' @rdname dtt_minute
#' @export
`dtt_minute<-` <- function(x, value) {
  .Deprecated("dtt_minute<-")
  UseMethod("dtt_minute<-")
}

#' @rdname dtt_minute
#' @export
`dtt_minute<-` <- function(x, value) {
  UseMethod("dtt_minute<-")
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
#' dtt_hour(Sys.time())
dtt_hour <- function(x, ...) {
  UseMethod("dtt_hour")
}

#' @rdname dtt_hour
#' @export
dtt_hours <- function(x, ...) {
  .Deprecated("dtt_hour")
  UseMethod("dtt_hour")
}

#' @rdname dtt_hour
#' @export
`dtt_hours<-` <- function(x, value) {
  .Deprecated("dtt_hour<-")
  UseMethod("dtt_hour<-")
}

#' @rdname dtt_hour
#' @export
`dtt_hour<-` <- function(x, value) {
  UseMethod("dtt_hour<-")
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
#' dtt_day(Sys.time())
dtt_day <- function(x, ...) {
  UseMethod("dtt_day")
}

#' @rdname dtt_day
#' @export
dtt_days <- function(x, ...) {
  .Deprecated("dtt_day")
  UseMethod("dtt_day")
}

#' @rdname dtt_day
#' @export
`dtt_day<-` <- function(x, value) {
  .Deprecated("dtt_day<-")
  UseMethod("dtt_day<-")
}

#' @rdname dtt_day
#' @export
`dtt_day<-` <- function(x, value) {
  UseMethod("dtt_day<-")
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
#' dtt_month(Sys.time())
dtt_month <- function(x, ...) {
  UseMethod("dtt_month")
}

#' @rdname dtt_month
#' @export
dtt_months <- function(x, ...) {
  .Deprecated("dtt_month")
  UseMethod("dtt_month")
}

#' @rdname dtt_month
#' @export
`dtt_months<-` <- function(x, value) {
  .Deprecated("dtt_month<-")
  UseMethod("dtt_month<-")
}

#' @rdname dtt_month
#' @export
`dtt_month<-` <- function(x, value) {
  UseMethod("dtt_month<-")
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
#' dtt_year(Sys.time())
dtt_year <- function(x, ...) {
  UseMethod("dtt_year")
}

#' @rdname dtt_year
#' @export
dtt_years <- function(x, ...) {
  .Deprecated("dtt_year")
  UseMethod("dtt_year")
}

#' @rdname dtt_year
#' @export
`dtt_years<-` <- function(x, value) {
  .Deprecated("dtt_year<-")
  UseMethod("dtt_year<-")
}

#' @rdname dtt_year
#' @export
`dtt_year<-` <- function(x, value) {
  UseMethod("dtt_year<-")
}

#' @export
dtt_units.Date <- function(x, ...) {
  x <- x[!is.na(x)]
  if(!length(x)) return("days")
  
  if(any(dtt_day(x) != 1L)) return("days")
  if(any(dtt_month(x) != 1L)) return("months")
  "years"
}

#' @export
dtt_units.POSIXct <- function(x, ...) {
  x <- x[!is.na(x)]
  if(!length(x)) return("seconds")
  
  if(any(dtt_second(x) != 0L)) return("seconds")
  if(any(dtt_minute(x) != 0L)) return("minutes")
  if(any(dtt_hour(x) != 0L)) return("hours")
  if(any(dtt_day(x) != 1L)) return("days")
  if(any(dtt_month(x) != 1L)) return("months")
  "years"
}

#' @export
dtt_units.dtt_duration <- function(x, ...) {
  x <- unclass(x)
  if(all(is.na(x))) return("seconds")
  if(mean(x, na.rm = TRUE) < 60) return("seconds")
  x <- x / 60
  if(mean(x, na.rm = TRUE) < 60) return("minutes")
  x <- x / 60
  if(mean(x, na.rm = TRUE) < 24) return("hours")
  x <- x / 24
  if(mean(x, na.rm = TRUE) < 30.41667) return("days")
  x < x / 30.41667
  if(mean(x, na.rm = TRUE) < 12) return("months")
  "years"
}

#' @export
dtt_second.POSIXct <- function(x, ...) {
  x <- as.POSIXlt(x, tz = dtt_tz(x))
  as.integer(x$sec)
}

#' @export
dtt_second.Date <- function(x, ...) rep(0L, length(x))

#' @export
dtt_second.hms <- function(x, ...) {
  x <- as.POSIXlt(x)
  as.integer(x$sec)
}

#' @export
dtt_second.dtt_duration <- function(x, ...) {
  check_unused(...)
  as.integer(x)
}

#' @export
dtt_second.POSIXct <- function(x, ...) {
  x <- as.POSIXlt(x, tz = dtt_tz(x))
  as.integer(x$sec)
}

#' @export
`dtt_second<-.POSIXct` <- function(x, value) {
  check_vector(value, c(0L, 59L), length = c(1L, 1L, length(x)))
  if(!length(x)) return(x)
  tz <- dtt_tz(x)
  x <- as.POSIXlt(x, tz = tz)
  x$sec <- value
  as.POSIXct(x, tz = tz)
}

#' @export
dtt_minute.Date <- function(x, ...) rep(0L, length(x))

#' @export
dtt_minute.POSIXct <- function(x, ...) {
  check_unused(...)
  x <- as.POSIXlt(x, tz = dtt_tz(x))
  as.integer(x$min)
}

#' @export
dtt_minute.dtt_duration <- function(x, ...) {
  check_unused(...)
  as_numeric(x, "minutes")
}

#' @export
`dtt_minute<-.POSIXct` <- function(x, value) {
  check_vector(value, c(0L, 59L), length = c(1L, 1L, length(x)))
  if(!length(x)) return(x)
  tz <- dtt_tz(x)
  x <- as.POSIXlt(x, tz = tz)
  x$min <- value
  as.POSIXct(x, tz = tz)
}

#' @export
dtt_hour.Date <- function(x, ...) rep(0L, length(x))

#' @export
dtt_hour.POSIXct <- function(x, ...) {
  x <- as.POSIXlt(x, tz = dtt_tz(x))
  as.integer(x$hour)
}

#' @export
dtt_hour.dtt_duration <- function(x, ...) {
  check_unused(...)
  as_numeric(x, "hours")
}

#' @export
`dtt_hour<-.POSIXct` <- function(x, value) {
  check_vector(value, c(0L, 23L), length = c(1L, 1L, length(x)))
  if(!length(x)) return(x)
  tz <- dtt_tz(x)
  x <- as.POSIXlt(x, tz = tz)
  x$hour <- value
  as.POSIXct(x, tz = tz)
}

#' @export
dtt_day.Date <- function(x, ...) as.integer(format(x, "%d"))

#' @export
dtt_day.POSIXct <- function(x, ...) {
  x <- as.POSIXlt(x, tz = dtt_tz(x))
  as.integer(x$mday)
}

#' @export
dtt_day.dtt_duration <- function(x, ...) {
  check_unused(...)
  as_numeric(x, "days")
}

#' @export
`dtt_day<-.Date` <- function(x, value) {
  check_vector(value, c(1L, 31L), length = c(1L, 1L, length(x)))
  if(!length(x)) return(x)
  x <- format(x)
  if(identical(length(value), 1L)) return(dtt_date(sub_day(x, value)))
  dtt_date(mapply(sub_day, x, value))
}

#' @export
`dtt_day<-.POSIXct` <- function(x, value) {
  check_vector(value, c(1L, 31L), length = c(1L, 1L, length(x)))
  if(!length(x)) return(x)
  tz <- dtt_tz(x)
  x <- as.POSIXlt(x, tz = tz)
  x$mday <- value
  as.POSIXct(x, tz = tz)
}

#' @export
dtt_month.Date <- function(x, ...) as.integer(format(x, "%m"))

#' @export
dtt_month.POSIXct <- function(x, ...) {
  x <- as.POSIXlt(x, tz = dtt_tz(x))
  as.integer(x$mon + 1L)
}

#' @export
dtt_month.dtt_duration <- function(x, ...) {
  check_unused(...)
  as_numeric(x, "months")
}

#' @export
`dtt_month<-.Date` <- function(x, value) {
  check_vector(value, c(1L, 12L), length = c(1L, 1L, length(x)))
  if(!length(x)) return(x)
  x <- format(x)
  if(identical(length(value), 1L)) return(dtt_date(sub_month(x, value)))
  dtt_date(mapply(sub_month, x, value))
}

#' @export
`dtt_month<-.POSIXct` <- function(x, value) {
  check_vector(value, c(1L, 12L), length = c(1L, 1L, length(x)))
  if(!length(x)) return(x)
  tz <- dtt_tz(x)
  x <- as.POSIXlt(x, tz = tz)
  x$mon <- value - 1L
  as.POSIXct(x, tz = tz)
}

#' @export
dtt_year.Date <- function(x, ...) as.integer(format(x, "%Y"))

#' @export
dtt_year.POSIXct <- function(x, ...) {
  x <- as.POSIXlt(x, tz = dtt_tz(x))
  as.integer(x$year + 1900L)
}

#' @export
dtt_year.dtt_duration <- function(x, ...) {
  check_unused(...)
  as_numeric(x, "years")
}

#' @export
`dtt_year<-.Date` <- function(x, value) {
  check_vector(value, c(1L, 2999L), length = c(1L, 1L, length(x)))
  if(!length(x)) return(x)
  x <- format(x)
  if(identical(length(value), 1L)) return(dtt_date(sub_year(x, value)))
  dtt_date(mapply(FUN = sub_year, x, value))
}

#' @export
`dtt_year<-.POSIXct` <- function(x, value) {
  check_vector(value, c(1L, 2999L), length = c(1L, 1L, length(x)))
  if(!length(x)) return(x)
  tz <- dtt_tz(x)
  x <- as.POSIXlt(x, tz = tz)
  x$year <- value - 1900L
  as.POSIXct(x, tz = tz)
}
