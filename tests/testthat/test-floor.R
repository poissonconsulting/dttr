context("floor")

test_that("floor", {
  expect_identical(dtt_floor(dates, "days"), dates)
  expect_identical(dtt_floor(dates, "months"), as.Date(c("2000-01-01", "1899-12-01", "1972-04-01")))

  x <- 100.9
  class(x) <- "Date"
  
  expect_identical(dtt_floor(x, "days"), as.Date("1970-04-11"))
  expect_identical(as.numeric(dtt_floor(x, "days")), 100)

  expect_identical(dtt_floor(date_times, "seconds"), date_times)
  expect_identical(dtt_floor(date_times, "hours"), as.POSIXct(
    c("2000-01-01 00:00:00", "1899-12-31 23:00:00", "1972-06-30 23:00:00"), 
    format = "%Y-%m-%d %H:%M:%S", tz = "Etc/GMT+8"))
})
