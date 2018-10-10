units_less_than <- function(x, y) {
  x <- ordered(x, levels = c("seconds", "minutes", "hours", "days", "months", "years"))
  y <- ordered(y, levels = c("seconds", "minutes", "hours", "days", "months", "years"))
  x < y
}

dtt_units2by <- function(x) {
  x <- sub("ond", "", x)
  x <- sub("ute", "", x)
  x
}

sub_year <- function(x, value) {
  sub("^(\\d{4,4})(-\\d{2,2}-\\d{2,2})$", paste0(value, "\\2"), x)
}

sub_month <- function(x, value) {
  sub("^(\\d{4,4}-)(\\d{2,2})(-\\d{2,2})$", paste0("\\1", value, "\\3"), x)
}

sub_day <- function(x, value) {
  sub("^(\\d{4,4}-\\d{2,2}-)(\\d{2,2})$", paste0("\\1", value), x)
}
