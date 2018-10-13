#' Dayte
#'
#' @param x A Date or POSIXct vector.
#' @param ... Unused.
#'
#' @return A Date or POSIXct vector with year as 1972.
#' @export
#'
#' @examples
#' dtt_dayte(Sys.Date())
dtt_dayte <- function(x) {
  check_dtt(x)
  dtt_year(x) <- 1972L
  x
}
