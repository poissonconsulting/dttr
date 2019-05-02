set_class <- function(x, class) {
  class(x) <- class
  x
}

set_attr <- function(x, attr, value) {
  attr(x, attr) <- value
  x
}

err <- function(...) stop(..., call. = FALSE, domain = NA)

wrn <- function(...) warning(..., call. = FALSE, domain = NA)

duration <- function(x) set_class(as.integer(x), "dtt_duration")

units_less_than <- function(x, y) {
  x <- ordered(x, levels = .units_POSIXct)
  y <- ordered(y, levels = .units_POSIXct)
  x < y
}

dtt_units2by <- function(x) {
  x <- sub("ond", "", x)
  x <- sub("ute", "", x)
  x
}

sub_year <- function(x, value) {
  sub("^(\\d{1,4})(-\\d{1,2}-\\d{1,2})$", paste0(value, "\\2"), x)
}

sub_month <- function(x, value) {
  sub("^(\\d{1,4}-)(\\d{1,2})(-\\d{1,2})$", paste0("\\1", value, "\\3"), x)
}

sub_day <- function(x, value) {
  sub("^(\\d{1,4}-\\d{1,2}-)(\\d{1,2})$", paste0("\\1", value), x)
}
