.units <- c("seconds", "minutes", "hours", "days", "months", "years")
.units_Date <- c("days", "months", "years")

.Date <- function(x) {
  class(x) <- "Date"
  x
}

.POSIXct <- function(x, tz) {
  class(x) <- c("POSIXct", "POSIXt")
  attr(x, "tzone") <- tz
  x
}
