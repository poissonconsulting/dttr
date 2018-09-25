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
