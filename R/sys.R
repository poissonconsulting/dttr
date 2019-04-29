.units <- c("seconds", "minutes", "hours", "days", "months", "years")
.units_Date <- c("days", "months", "years")

.POSIXct <- function(x, tz) {
  class(x) <- c("POSIXct", "POSIXt")
  attr(x, "tzone") <- tz
  x
}

err <- function(...) stop(..., call. = FALSE, domain = NA)
wrn <- function(...) warning(..., call. = FALSE, domain = NA)
