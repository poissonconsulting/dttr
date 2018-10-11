#' Season
#'
#' Returns an ordered factor of the user specified seasons.
#' 
#' If the first month of the first season isn't January (1L), then
#' the last season is considered to wrap into the following year.
#'
#' @param x A Date or POSIXct vector
#' @param seasons A uniquely named integer vector of the first month of each season.
#'
#' @return An ordered factor of the seasons.
#' @export
#' @examples
#' dates <- as.Date(c("2001-01-01", "2001-02-28", "2012-09-01", "2012-12-01"))
#' dtt_season(dates)
#' dtt_season(dates, season = c(Monsoon = 2L, `Dry Period` = 6L))
dtt_season <- function (x, seasons = c(Spring = 3L, Summer = 6L,
                                            Autumn = 9L, Winter = 12L)) {
  checkor(check_vector(x, c(Sys.Date(), NA)),
          check_vector(x, c(Sys.time(), NA)))
  check_vector(seasons, c(1L, 12L), length = c(1, .Machine$integer.max),
               unique = TRUE, sorted = TRUE)
  check_names(seasons, unique = TRUE)

  is_length <- length(x)
  if(!is_length) x <- as.Date("2000-01-01")

  if(seasons[1] != 1L) {
    start <- 1L
    names(start) <- names(seasons)[length(seasons)]
    seasons <- c(start, seasons)
  }
  
  breaks <- paste("1972", seasons, "01", sep = "-")
  breaks <- c(breaks, "1973-12-31")
  breaks <- dtt_date(breaks)

  x <- dtt_dayte(x)
  x <- cut(x, breaks = breaks, include.lowest = TRUE, ordered_result = TRUE)

  levels(x) <- names(seasons)
  if(!is_length) x <- x[-1]
  x
}
