#' Use a dtt_timer
#'
#' @param seconds A count of the start time in seconds.
#' @param start A flag indicating whether to start the timer.
#' @param x A dtt_timer object.
#'
#' @return A dtt_timer
#' @export
#'
#' @examples
#' # create a new timer
#' t <- dtt_timer()
#'
#' # no time has elapsed because the timer has not started
#' dtt_elapsed(t)
#'
#' # start the timer
#' t <- dtt_start(t)
#'
#' # get the time elapsed
#' # time elapsed is increasing because the timer is still running
#' dtt_elapsed(t)
#' dtt_elapsed(t)
#'
#' # stop the timer
#' t <- dtt_stop(t)
#'
#' # time elapsed is now fixed
#' dtt_elapsed(t)
#' dtt_elapsed(t)
#'
#' # reset the timer
#' t <- dtt_reset(t)
#' dtt_elapsed(t)
dtt_timer <- function(seconds = 0L, start = FALSE) {
  check_count(seconds)
  check_flag(start)
 
  x <- list() 
  x$seconds <- seconds
  class(x) <- c("dtt_timer")
  if(start) x <- dtt_start(x)
  x
}

#' @describeIn dtt_timer Start
#' @export
dtt_start <- function(x) {
  if(dtt_is_running(x)) {
    wrn("dtt_timer is already started")
    return(x)
  }
  x$start <- as.integer(Sys.time())
  x
}

#' @describeIn dtt_timer Stop
#' @export
dtt_stop <- function(x) {
  if(!dtt_is_running(x)) {
    wrn("dtt_timer is already stopped")
    return(x)
  }
  x$seconds <- as.integer(dtt_elapsed(x))
  x$start <- NULL
  x
}

#' @describeIn dtt_timer Elapsed Duration
#' @export
dtt_elapsed <- function(x) {
  seconds <- as.integer(x$seconds)
  if(dtt_is_running(x)) 
    seconds <- seconds + as.integer(Sys.time()) - x$start
  dtt_duration(seconds)
}

#' @describeIn dtt_timer Reset
#' @export
dtt_reset <- function(x, seconds = 0L, start = FALSE) {
  dtt_timer(seconds = seconds, start = start)
}

#' @describeIn dtt_timer Is Running
#' @export
dtt_is_running <- function(x) {
  check_timer(x)
  !is.null(x$start)
}

#' @export
format.dtt_timer <- function(x, units = "auto", digits = 2, ...) {
  check_unused(...)
  format(dtt_elapsed(x), units = units, digits = digits)
}

#' @export
print.dtt_timer <- function(x, units = "auto", ...) {
  check_unused(...)
  cat(format(x, units = units), "\n")
}
